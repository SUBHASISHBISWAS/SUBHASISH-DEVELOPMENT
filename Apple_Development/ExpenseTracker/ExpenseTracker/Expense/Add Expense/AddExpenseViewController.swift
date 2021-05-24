//
//  ViewController.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 05/01/21.
//

import UIKit

class AddExpenseViewController: UIViewController {

    let _colorData = [#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1),#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1),#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1),#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1),#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1),#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1),#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1),#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1),#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1),#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1),#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1),#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1),#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)]
    
    @IBOutlet weak var _expenseDescription: UITextField!
    @IBOutlet weak var _expenseAmount: UITextField!{didSet{showToolBarInNumberPad(textField: self._expenseAmount)}}
    @IBOutlet weak var _expenseDate: UITextField!
    @IBOutlet weak var _totalExpense: UILabel!
    @IBOutlet weak var _cardType: UITextField!
    @IBOutlet weak var _expenseByMonthHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var expenseByTypeHeightConstraint: NSLayoutConstraint!
    @IBOutlet var _addExpense :UIButton!
    @IBOutlet weak var _activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var _expenseTrackerNavItem: UINavigationItem!
    @IBOutlet weak var _expenseByMonthCView: UICollectionView!
    @IBOutlet weak var _expenseByTypeCView: UICollectionView!
    
    
    let flexibleButton=UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    let _expenseDatePicker=UIDatePicker()
    let _cardTypePickerView = UIPickerView()
    let _context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let _collectionViewDynamicWidhthFactor :CGFloat = 1.5;
    var _expenseByMonthCVDataSource :CVExpenseByMonthDataSource?
    var _expenseByCardCVDataSource :CVExpenseCardDataSource?
    var _cardTypePVDataSource :PVCardTypeDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _expenseTrackerNavItem.title = "Expense"
        _totalExpense.textColor = UIColor.red
        _expenseDate.delegate = self
        _expenseDate.textAlignment = .center
        _expenseDate.text=DateExtension.cardDateFormatter.string(from: Date())
        _cardType.inputView = _cardTypePickerView
        _cardType.textAlignment = .center
        _cardType.placeholder = "Card Type"
        _expenseAmount.textAlignment = .center
        
        
        _expenseByMonthCView.register(ExpenseByMonthCVCell.nib(), forCellWithReuseIdentifier: ExpenseByMonthCVCell.cellIdetifier)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.expenseTypeDidChanged), name: UITextField.textDidChangeNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.expenseAmountDidChanged), name: UITextField.textDidChangeNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.cardTypeDidChanged), name: UITextField.textDidChangeNotification, object: nil)
        
        self._expenseByCardCVDataSource = CVExpenseCardDataSource.shared
        self._expenseByTypeCView.dataSource = self._expenseByCardCVDataSource
        self._expenseByTypeCView.delegate = self._expenseByCardCVDataSource
        
        self._expenseByMonthCVDataSource = CVExpenseByMonthDataSource.shared
        self._expenseByMonthCView.dataSource = self._expenseByMonthCVDataSource
        self._expenseByMonthCView.delegate = self._expenseByMonthCVDataSource
        
        self._cardTypePVDataSource=PVCardTypeDataSource.shared
        self._cardTypePickerView.dataSource = self._cardTypePVDataSource
        self._cardTypePickerView.delegate = self._cardTypePVDataSource
        _cardTypePVDataSource?._delegate = self
        
        // On Default Card Added
        EventEmitter.subscribe(name: "DefaultCardAdded") { (data) in
            print((data as! [Card]).count)
            
            let cards=(data as! [Card])
            
            if (cards.count > 0)
            {
                self._cardTypePickerView.selectRow(0, inComponent: 0, animated: true)
                self._cardTypePVDataSource?.pickerView(self._cardTypePickerView, didSelectRow: 0, inComponent: 0)
            }
            
            ExpenseByCardManger.map(cards: cards, completion: { [weak self] (expenseByTypeModels) in
                guard let self = self else { return }
                
                self._expenseByCardCVDataSource!.UpdateDataSource(data: expenseByTypeModels)
                let indexPath = IndexPath(row: expenseByTypeModels.count-1, section: 0)
                self._expenseByTypeCView.insertItems(at: [indexPath])
                self._expenseByTypeCView.reloadData()
                self._expenseByTypeCView.collectionViewLayout.invalidateLayout()
                self._expenseByTypeCView.layoutSubviews()
            })
            
            ExpenseByMonthManager.map(cards: cards) { [weak self] (ExpenseByMonthModels) in
                guard let self = self else { return }
                self._expenseByMonthCVDataSource!.UpdateDataSource(data: ExpenseByMonthModels)
                self._expenseByMonthCView.reloadData()
                self._expenseByMonthCView.collectionViewLayout.invalidateLayout()
                self._expenseByMonthCView.layoutSubviews()
            }
            
            
        }
        
        CardManager.GetCards( completion: { [weak self] (Cards) in
            guard let self = self else { return }
            
            self._cardTypePVDataSource?.UpdateDataSource(data: Cards)
            self._cardTypePickerView.reloadAllComponents()
            
            if (Cards.count > 0)
            {
                self._cardTypePickerView.selectRow(0, inComponent: 0, animated: true)
                self._cardTypePVDataSource?.pickerView(self._cardTypePickerView, didSelectRow: 0, inComponent: 0)
            }
        })
        
        // On Loading Application Show View
        ExpenseByMonthManager.GetMonthlyExpenes { [weak self] (ExpenseByMonthModels) in
            guard let self = self else { return }
            self._expenseByMonthCVDataSource!.UpdateDataSource(data: ExpenseByMonthModels)
            self._expenseByMonthCView.reloadData()
            self._expenseByMonthCView.collectionViewLayout.invalidateLayout()
            self._expenseByMonthCView.layoutSubviews()
        }
        
        ExpenseByCardManger.GetExpenesByCard { [weak self] (ExpenseByTypeModels) in
            guard let self = self else { return }
            
            self._expenseByCardCVDataSource!.UpdateDataSource(data: ExpenseByTypeModels)
            self._expenseByTypeCView.reloadData()
            self._expenseByTypeCView.collectionViewLayout.invalidateLayout()
            self._expenseByTypeCView.layoutSubviews()
            
        }
         
        
        
        // On Addition and Deletion Update View
        EventEmitter.subscribe(name: "UpdateCards") { (data) in
            print((data as! [Card]).count)
            
          
            ExpenseByCardManger.map(cards: data as! [Card], completion: { [weak self] (expenseByTypeModels) in
                guard let self = self else { return }
                
                
                self._expenseByCardCVDataSource!.UpdateDataSource(data: expenseByTypeModels)
                let indexPath = IndexPath(row: expenseByTypeModels.count-1, section: 0)
                self._expenseByTypeCView.insertItems(at: [indexPath])
                self._expenseByTypeCView.reloadData()
                self._expenseByTypeCView.collectionViewLayout.invalidateLayout()
                self._expenseByTypeCView.layoutSubviews()
            })
            
            ExpenseByMonthManager.map(cards: data as! [Card], completion: { [weak self] (expenseByMonthModels) in
                
                guard let self = self else { return }
                self._expenseByMonthCVDataSource?.UpdateDataSource(data: expenseByMonthModels)
                self._expenseByMonthCView.reloadData()
                self._expenseByMonthCView.collectionViewLayout.invalidateLayout()
                self._expenseByMonthCView.layoutSubviews()
            })
            
            self._cardTypePVDataSource?.UpdateDataSource(data: data as! [Card])
            self._cardTypePickerView.reloadAllComponents()
        }
        
        handleAddButtonState()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        _totalExpense.text=String(ExpenseManager.GetTotalExpenses())
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setHeightForExpenseByMonthCView()
        setHeightForExpenseByTypeCView()
    }
    
    
    
    @IBAction func expenseTypeDoneButton_Pressed(_ sender: Any) {
        _expenseDescription.resignFirstResponder()
    }
    
    @IBAction func addExpense_Click(_ sender: Any) {
        _expenseAmount.resignFirstResponder()
    }
    
    
    
    @IBAction func addButton_Clicked(_ sender: Any) {
        
        _activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self._activityIndicator.stopAnimating()
        }
        
        let expenseAmount = Double(_expenseAmount.text!)!
        let expenseDescription = _expenseDescription.text!
        let transactionType = _cardType.text!
        guard let expenseDate = DateExtension.GetDate(stringDate: _expenseDate.text!) else { return }
        
        ExpenseManager.AddExpense(amount: expenseAmount, transactionDescription: expenseDescription, cardName: transactionType,transactionDate: expenseDate)
        
        _expenseDescription.text=""
        _expenseAmount.text=""
        
        _totalExpense.text=String(ExpenseManager.GetTotalExpenses())
        
        handleAddButtonState()
        
        
        ExpenseByMonthManager.GetMonthlyExpenes { [weak self] (monthyOveviewModels) in
            guard let self = self else { return }
            self._expenseByMonthCVDataSource?.UpdateDataSource(data: monthyOveviewModels)
            self._expenseByMonthCView.reloadData()
        }
        ExpenseByCardManger.GetExpenesByCard { [weak self] (expenseByTypeModels) in
            guard let self = self else { return }
            self._expenseByCardCVDataSource?.UpdateDataSource(data: expenseByTypeModels)
            self._expenseByTypeCView.reloadData()
        }
         
    }
    
    
    
    @objc func datePickerDonePressed(){
        
        _expenseDate.text=DateExtension.cardDateFormatter.string(from: _expenseDatePicker.date)
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        switch segue.identifier {
            case "expenByTypeForMothSegue":
                if let destVC = segue.destination as? MonthlyExpenseByTypeCollectionView{
                    let cell=sender as! ExpenseByMonthCVCell
                    destVC.transactionDate = cell._monthlyOverviewModel?.transactionDate
                }
                
            default:
                print("HI")
        }
        
    }
    
    
}

extension AddExpenseViewController : ICardsDelegate
{
    func UpdateCards(info: CardsData) {
        
    }
    
}





