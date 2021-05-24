//
//  CardsViewController.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 18/01/21.
//

import UIKit

class CardsViewController: UIViewController, ICardsDelegate {
    

    @IBOutlet weak var _cardsCollectionView: UICollectionView!
    @IBOutlet weak var addCardButton: UIBarButtonItem!
    @IBOutlet weak var _deleteCardsButton: UIBarButtonItem!
    @IBOutlet weak var _buttomNavBar: UINavigationBar!
      
    var _cardsDataSource : CardsDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CardManager.GetCards( completion: { [weak self] (Cards) in
            guard let self = self else { return }
            
            //self._cardsDataSource = CardsDataSource(cards: Cards, viewController: self)
            //self._cardsCollectionView.dataSource = self._cardsDataSource
            //self._cardsCollectionView.delegate = self._cardsDataSource
            
            
            if (Cards.count) == 0
            {
                CardManager.AddCard(cardName: "CASH", cardNumber: "CASH", cardType: "CASH", cardCvv: 0, creditLimit: 0, bankName: "CASH", userName: "SUBHASISH", password: "SUBHASISH", gracePeriod :0, expiryDate: DateExtension.GetDate(stringDate: "31-Dec-2021")!, dueDate: DateExtension.GetDate(stringDate: "31-Dec-2021")!, statementDate: DateExtension.GetDate(stringDate: "31-Dec-2021")!){ [unowned self] (cards) in
                    
                    self._cardsDataSource = CardsDataSource(cards: cards, viewController: self)
                    self._cardsCollectionView.dataSource = self._cardsDataSource
                    self._cardsCollectionView.delegate = self._cardsDataSource
                    self._cardsCollectionView.reloadData()
                    
                    
                    let indexPath = IndexPath(row: cards.count-1, section: 0)
                    self.navigationController?.popToRootViewController(animated: true)
                    self.UpdateCards(info: CardsData(_cards: cards, _indexPath: indexPath))
                    EventEmitter.publish(name: "DefaultCardAdded", args: cards)
                }
            }
            else
            {
                if self._cardsDataSource == nil {
                    self._cardsDataSource = CardsDataSource(cards: Cards, viewController: self)
                    self._cardsCollectionView.dataSource = self._cardsDataSource
                    self._cardsCollectionView.delegate = self._cardsDataSource
                }
                self._cardsCollectionView.reloadData()
            }
            
            
        })
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    override func awakeFromNib() {
           super.awakeFromNib()
    }
    
    func UpdateCards(info: CardsData) {
    
        _cardsDataSource?.UpdateDataSource(data: info._cards)
        _cardsCollectionView.insertItems(at: [info._indexPath])
        
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        _cardsCollectionView.allowsMultipleSelection = editing
        
        addCardButton.isEnabled = !isEditing
        _buttomNavBar.isHidden = !isEditing
        
        _cardsCollectionView.indexPathsForSelectedItems?.forEach({ (indexPath) in
            _cardsCollectionView.deselectItem(at: indexPath, animated: true)
        })
        _cardsCollectionView.indexPathsForVisibleItems.forEach { (indexPath) in
            let cell = _cardsCollectionView.cellForItem(at: indexPath) as! CardsCollectionViewCell
            cell.isEditing = editing
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        
        if segue.identifier == "cardDetails" {
            
            guard let selectedCard = sender as? Card else {
                return
            }
            guard let destVc = segue.destination as? CardDetailsViewController else {
                return
            }
            destVc.selectedCard = selectedCard
        }
        
        if segue.identifier == "addCard" {
            guard let destVc = segue.destination as? AddCardViewController else {
                return
            }
            destVc._delegate = self
        }
    }
    
    @IBAction func addCard(_ sender: Any) {
        self.performSegue(withIdentifier: "addCard", sender: nil)
    }
    
    
    @IBAction func deleteSelectedItem(_ sender : UIBarButtonItem){
        if let selectedCards = _cardsCollectionView.indexPathsForSelectedItems{
            let cards =  selectedCards.map{$0.item}.sorted().reversed()
            
            for card in cards {
                CardManager.DeleteCard(id: card, completion: { [self](cards) in
                    
                    let indexPath = IndexPath(row: cards.count, section: 0)
                    self._cardsDataSource?.UpdateDataSource(data: cards)
                    self._cardsCollectionView.deleteItems(at: [indexPath])
                    EventEmitter.publish(name: "UpdateCards", args: cards)
                } )
            }
        }
    }

}

protocol ICardsDelegate {
    func UpdateCards(info: CardsData)
}

struct CardsData{
    var _cards : [Card]
    var _indexPath : IndexPath
}


