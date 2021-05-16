//
//  UIPickerViewDelegate.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 12/01/21.
//

import Foundation
import UIKit

extension AddExpenseViewController
{
    func showToolBarInNumberPad(textField : UITextField)  {
        let toolbar = UIToolbar(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 0, height: 40)))
        toolbar.items = [flexibleButton,UIBarButtonItem(barButtonSystemItem: .done, target: textField,
            action: #selector(resignFirstResponder))]
        textField.inputAccessoryView = toolbar
    }
    
    func handleAddButtonState()
    {
        if (_expenseDescription.text != "" && _expenseAmount.text != "" && _cardType.text != "" ) {
            _addExpense.isEnabled = true
            _addExpense.setTitleColor(UIColor.white, for: UIControl.State.normal)
        }
        else{
            _addExpense.isEnabled = false
            _addExpense.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        }
    }
    
    func setHeightForExpenseByMonthCView()  {
       
        let width=_expenseByMonthCView.bounds.width / _collectionViewDynamicWidhthFactor
        let height=width/1.5
        _expenseByMonthHeightConstraint.constant = height
    }
    
    func setHeightForExpenseByTypeCView()  {
       
        let width=_expenseByTypeCView.bounds.width / _collectionViewDynamicWidhthFactor
        let height=width/1.5
        expenseByTypeHeightConstraint.constant = height
    }
    
    @objc func expenseTypeDidChanged() {
        handleAddButtonState()
    }
    
    @objc func expenseAmountDidChanged(){
        handleAddButtonState()
    }
    
    @objc func cardTypeDidChanged(){
        handleAddButtonState()
    }
}
