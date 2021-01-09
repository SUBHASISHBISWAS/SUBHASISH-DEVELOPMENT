//
//  ViewController.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 05/01/21.
//

import UIKit

class AddExpenseViewController: UIViewController {

    
    @IBOutlet weak var _expenseDescription: UITextField!
    @IBOutlet weak var _expenseAmount: UITextField!
    @IBOutlet weak var _expenseDate: UITextField!
    @IBOutlet weak var _totalExpense: UILabel!
    @IBOutlet weak var _transactionType: UITextField!
    
    @IBOutlet weak var _monthOverviewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet var _addExpense :UIButton!
    @IBOutlet weak var _activityIndicator: UIActivityIndicatorView!

    @IBOutlet weak var _expenseByExpenseType: UILabel!
    @IBOutlet weak var _expenseByMonth: UILabel!
    
    @IBOutlet weak var expenseOverviewCollectionView: UICollectionView!
    
    let _expenseDatePicker=UIDatePicker()
    let _transactionTypePickerView = UIPickerView()
    
    let _context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let _typeOfTransactions = ["Cash", "Card", "HDFC", "ICIC"]
    
    let _colorData = [#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1),#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1),#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1),#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1),#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1),#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1),#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1),#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1),#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1),#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1),#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1),#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1),#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)]
    
    //let _months = ["Jan", "Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    
    var _months = [MonthyOveviewModel]()
    
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
        
        expenseOverviewCollectionView.dataSource=self
        expenseOverviewCollectionView.delegate=self
        
        _totalExpense.textColor = UIColor.red
        
        _expenseDate.textAlignment = .center
        _expenseDate.text=expenseDateFormatter.string(from: Date())
        
        createExpenseDatePicker()
        _transactionType.inputView = _transactionTypePickerView
        
        
        _transactionType.textAlignment = .center
        _transactionType.placeholder = "Select Transaction Type "
        _transactionType.text = "Cash"
        
        //_expenseByExpenseType.text=String(ExpenseManager.GetExpenseByExpensType(transactionType: "HDFC"))
        
        MonthlyOverviewManager.GetMonthlyExpenes { [weak self] (MonthyOveviewModels) in
            guard let self = self else { return }
            self._months=MonthyOveviewModels
            self.expenseOverviewCollectionView.reloadData()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        _totalExpense.text=String(ExpenseManager.GetTotalExpenses())
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setHeightFormonthOverviewCollectionView()
    }
    func setHeightFormonthOverviewCollectionView()  {
       
        let width=expenseOverviewCollectionView.bounds.width;
        let height=width/1.5
        _monthOverviewHeightConstraint.constant = height
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
        
        //ExpenseManager.GetExpenseByMonth(expenseDate: expenseDate)
        MonthlyOverviewManager.GetMonthlyExpenes { [weak self] (MonthyOveviewModels) in
            guard let self = self else { return }
            self._months=MonthyOveviewModels
            self.expenseOverviewCollectionView.reloadData()
        }
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

extension AddExpenseViewController : UIPickerViewDataSource
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

extension AddExpenseViewController : UIPickerViewDelegate
{
    // Sets number of columns in picker view
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
            return 1
        }
}

extension AddExpenseViewController:UICollectionViewDelegate
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension AddExpenseViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _months.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonthlyExpenseOverViewCell", for: indexPath) as! MonthlyExpenseOverViewCellCollectionViewCell
        cell.setup(monthlyOverviewModel: _months[indexPath.item])
        
        //cell.setup(backgroundColor: _months[indexPath.item], count: indexPath.item)
        //cell.backgroundColor=_colorData[indexPath.item]
        
        return cell
    }
    
    
}

extension AddExpenseViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        /*
        let rows : CGFloat = 1
        
        let collectionViewHeight=collectionView.bounds.height
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (rows - 1)
        let adjustedHeight=collectionViewHeight - spaceBetweenCells
        let height : CGFloat = floor(adjustedHeight/rows)
        let width :CGFloat = height/1.5
        return CGSize(width: width, height: height)
         */
        let width=expenseOverviewCollectionView.bounds.width-50;
        let height=width/1.5
        return CGSize(width: width, height: height)
 
    }
}



