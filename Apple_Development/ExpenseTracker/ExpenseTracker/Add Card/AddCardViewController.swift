//
//  AddCardViewController.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 18/01/21.
//

import UIKit

class AddCardViewController: UIViewController {

    var _delegate : CardsCallBackDelegate?
    
    let flexibleButton=UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    
    @IBOutlet weak var _cardNameText: UITextField!
    @IBOutlet weak var _cardNumberText: UITextField!{didSet{showToolBarInNumberPad(textField: self._cardNumberText)}}
    @IBOutlet weak var _cardTypeText: UITextField!
    @IBOutlet weak var _cvvText: UITextField!{didSet{showToolBarInNumberPad(textField: self._cvvText)}}
    @IBOutlet weak var _creditLimitText: UITextField!{didSet{showToolBarInNumberPad(textField: self._creditLimitText)}}
    @IBOutlet weak var _bankNameText: UITextField!
    @IBOutlet weak var _userNameText: UITextField!
    @IBOutlet weak var _passwordText: UITextField!
    @IBOutlet weak var _graceperiodText: UITextField!{didSet{showToolBarInNumberPad(textField: self._graceperiodText)}}
    @IBOutlet weak var _expiryDate: UITextField!
    @IBOutlet weak var _dueDateText: UITextField!
    @IBOutlet weak var _statementDateText: UITextField!

    let _cardTypePickerView = UIPickerView()
    var _cardTypePickerViewDataSource :ExpensePickerViewDataSource?
    var _cardType = ["VISA","MASTER","AMEX"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _expiryDate.delegate=self
        _statementDateText.delegate = self
        _dueDateText.delegate = self

        self._cardTypePickerViewDataSource=ExpensePickerViewDataSource(expensePickerViewDataProvider: CardeTypePickerViewDataProvider(data: _cardType, viewController: self))
        _cardTypePickerView.dataSource = _cardTypePickerViewDataSource
        _cardTypePickerView.delegate = _cardTypePickerViewDataSource
        _cardTypeText.inputView = _cardTypePickerView
    }
    
    func showToolBarInNumberPad(textField : UITextField)  {
        let toolbar = UIToolbar(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 0, height: 40)))
        toolbar.items = [flexibleButton,UIBarButtonItem(barButtonSystemItem: .done, target: textField,
            action: #selector(resignFirstResponder))]
        textField.inputAccessoryView = toolbar
    }
    
    
    @IBAction func addCard(_ sender: Any) {

        let cardName = _cardNameText.text!
        let cardNumber = _cardNumberText.text!
        let cardType = _cardTypeText.text!
        guard let cardCvv = Int16(_cvvText.text!) else { return }
        guard let creditLimit = Int64(_creditLimitText.text!) else { return }
        let bankName = _bankNameText.text!
        let userName = _userNameText.text!
        let password = _passwordText.text!
        guard let gracePeriod = Int32(_graceperiodText.text!) else { return }
        guard let dueDate = DateExtension.GetDate(stringDate: _dueDateText.text!) else { return }
        guard let experiyDate = DateExtension.GetDate(stringDate: _dueDateText.text!) else { return }
        guard let statementDate = DateExtension.GetDate(stringDate: _statementDateText.text!) else {  return }
        
        

        CardManager.AddCard(cardName: cardName, cardNumber: cardNumber, cardType: cardType, cardCvv: cardCvv, creditLimit: creditLimit, bankName: bankName, userName: userName, password: password, gracePeriod: gracePeriod, expiryDate: experiyDate, dueDate: dueDate, statementDate: statementDate){ [unowned self] (cards) in
            let indexPath = IndexPath(row: cards.count-1, section: 0)
            self.navigationController?.popToRootViewController(animated: true)
            self._delegate?.GetCardsData(info: CardsData(_cards: cards, _indexPath: indexPath))
            EventEmitter.publish(name: "AddExpenseViewController", args: cards)
        }
        
        
    }

    

       
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: string)) else {
            return false
        }
        return true
    }
    
    
    @IBAction func cardName_DonePressed(_ sender: Any) {
        _cardNameText.resignFirstResponder()
    }
    
    @IBAction func bankName_DonePressed(_ sender: Any) {
        _bankNameText.resignFirstResponder()
    }
    
    @IBAction func userName_DonePressed(_ sender: Any) {
        _userNameText.resignFirstResponder()
    }
    
    @IBAction func password_DonePressed(_ sender: Any) {
        _passwordText.resignFirstResponder()
    }
    
    
}