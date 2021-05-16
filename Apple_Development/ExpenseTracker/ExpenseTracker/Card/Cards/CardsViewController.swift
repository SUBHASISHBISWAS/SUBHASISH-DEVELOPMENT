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
            
            self._cardsDataSource = CardsDataSource(cards: Cards, viewController: self)
            self._cardsCollectionView.dataSource = self._cardsDataSource
            self._cardsCollectionView.delegate = self._cardsDataSource
            self._cardsCollectionView.reloadData()
        })
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    override func awakeFromNib() {
           super.awakeFromNib()
    }
    
    func GetCardsData(info: CardsData) {
    
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
                    EventEmitter.publish(name: "AddExpenseViewController", args: cards)
                } )
            }
        }
    }

}

protocol ICardsDelegate {
    func GetCardsData(info: CardsData)
}

struct CardsData{
    var _cards : [Card]
    var _indexPath : IndexPath
}
