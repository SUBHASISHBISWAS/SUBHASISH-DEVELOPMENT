//
//  ViewController.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 05/01/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var _expenseDescription: UITextField!
    @IBOutlet weak var _expenseAmount: UITextField!
    @IBOutlet weak var _expenseDate: UITextField!
    @IBOutlet weak var _totalExpense: UILabel!
    @IBOutlet weak var _transactionType: UITextField!
    
    @IBOutlet var _addExpense :UIButton!
    @IBOutlet weak var _activityIndicator: UIActivityIndicatorView!

    
    
    let _expenseDatePicker=UIDatePicker()
    let _transactionTypePickerView = UIPickerView()
    
    let _context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let _typeOfTransactions = ["Cash", "Card", "HDFC", "ICIC"]
    
    
    let expenseDateFormatter: DateFormatter =
        {
            let expenseDateFormatter = DateFormatter()
            expenseDateFormatter.timeZone = .current
            expenseDateFormatter.locale = .current
            expenseDateFormatter.dateStyle = .medium
            expenseDateFormatter.timeStyle = .none
            expenseDateFormatter.dateFormat = "dd-MMM-yyyy"
            return expenseDateFormatter
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.expenseTypeDidChanged), name: UITextField.textDidChangeNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.expenseAmountDidChanged), name: UITextField.textDidChangeNotification, object: nil)
        
        _transactionTypePickerView.dataSource = self
        _transactionTypePickerView.delegate = self
        
        _totalExpense.textColor = UIColor.red
        
        _expenseDate.textAlignment = .center
        _expenseDate.text=expenseDateFormatter.string(from: Date())
        
        createExpenseDatePicker()
        _transactionType.inputView = _transactionTypePickerView
        
        
        _transactionType.textAlignment = .center
        _transactionType.placeholder = "Select Transaction Type "
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        _totalExpense.text=String(ExpenseManager.GetTotalExpenses())
    }
    
    

    @objc func expenseTypeDidChanged() {
        handleAddButtonState()
    }
    @objc func expenseAmountDidChanged(){
        handleAddButtonState()
    }
    
    @IBAction func expenseTypeDoneButton_Pressed(_ sender: Any) {
        _expenseDescription.resignFirstResponder()
    }
    
    @IBAction func addExpense_Click(_ sender: Any) {
        _expenseAmount.resignFirstResponder()
    }
    
    func handleAddButtonState()
    {
        if (_expenseDescription.text != "" && _expenseAmount.text != "" ) {
            _addExpense.isEnabled = true
        }
        else{
            _addExpense.isEnabled = false
        }
        
        if (_expenseDescription.text != "" && _expenseAmount.text != "" )
        {
            _addExpense.setTitleColor(UIColor.white, for: UIControl.State.normal)
        }
        else
        {
            _addExpense.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        }
    }
    
    @IBAction func addButton_Clicked(_ sender: Any) {
        
        _activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self._activityIndicator.stopAnimating()
        }
        
        let expenseAmount = Double(_expenseAmount.text!)!
        let expenseDescription = _expenseDescription.text!
        let transactionType = _transactionType.text!
        //let expenseDate = expenseDateFormatter.date(from: _expenseDate.text!)
        let expenseDate = GetTransactionDate()
       
        ExpenseManager.AddExpense(amount: expenseAmount, transactionDescription: expenseDescription, transactionType: transactionType,transactionDate: expenseDate)
        
        _expenseDescription.text=""
        _expenseAmount.text=""
        
        _totalExpense.text=String(ExpenseManager.GetTotalExpenses())
    }
    
    func GetTransactionDate() -> Date {
        
        let components =
            _expenseDatePicker.calendar.dateComponents([.day,.month,.year,.hour,.minute,.second], from: _expenseDatePicker.date)
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar.date(from: components)!
        
    }
    
    func createExpenseDatePicker() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        //expenseDatePicker.translatesAutoresizingMaskIntoConstraints = false
        //toolBar.translatesAutoresizingMaskIntoConstraints = true
        let doneButton=UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(datePickerDonePressed))
        toolBar.setItems([doneButton], animated: false)
        _expenseDate.inputAccessoryView=toolBar;
        _expenseDate.inputView=_expenseDatePicker
        
        _expenseDatePicker.datePickerMode = .date
        _expenseDatePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
    }
    
    
    @objc func datePickerDonePressed(){
        
        _expenseDate.text=expenseDateFormatter.string(from: _expenseDatePicker.date)
        self.view.endEditing(true)
    }
    
    
    
    
}

extension ViewController : UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Sets the number of rows in the picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return _typeOfTransactions.count
        }
    
    // This function sets the text of the picker view to the content of the "salutations" array
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return _typeOfTransactions[row]
        }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        _transactionType.text=_typeOfTransactions[row]
        _transactionType.resignFirstResponder()
    }
}

extension ViewController : UIPickerViewDelegate
{
    // Sets number of columns in picker view
        func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
            return 1
        }
}

