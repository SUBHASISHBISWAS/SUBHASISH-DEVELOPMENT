//
//  ViewController.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 05/01/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var expenseType: UITextField!
    @IBOutlet weak var expenseAmount: UITextField!
    @IBOutlet var addExpense :UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.expenseTypeDidChanged), name: UITextField.textDidChangeNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.expenseAmountDidChanged), name: UITextField.textDidChangeNotification, object: nil)
        
    }

    @objc func expenseTypeDidChanged() {
        handleAddButtonState()
    }
    @objc func expenseAmountDidChanged(){
        handleAddButtonState()
    }
    
    @IBAction func expenseTypeDoneButton_Pressed(_ sender: Any) {
        expenseType.resignFirstResponder()
    }
    
    @IBAction func addExpense_Click(_ sender: Any) {
        expenseAmount.resignFirstResponder()
    }
    
    func handleAddButtonState()
    {
        if (expenseType.text != "" && expenseAmount.text != "" ) {
            addExpense.isEnabled = true
        }
        else{
            addExpense.isEnabled = false
        }
        
        if (expenseType.text != "" && expenseAmount.text != "" )
        {
            addExpense.setTitleColor(UIColor.white, for: UIControl.State.normal)
        }
        else
        {
            addExpense.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        }
    }
    
    @IBAction func addButton_Clicked(_ sender: Any) {
        
        activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.activityIndicator.stopAnimating()
        }
        
        ExpenseManager.AddExpense(amount: Double(expenseAmount.text!)!, expenseType: expenseType.text!, expenseMedium: "Card")
        expenseType.text=""
        expenseAmount.text=""
        
    }
}

