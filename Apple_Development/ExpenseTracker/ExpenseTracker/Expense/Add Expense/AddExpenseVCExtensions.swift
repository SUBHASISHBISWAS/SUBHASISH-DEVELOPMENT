//
//  AddExpenseVCExtensions.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 25/05/21.
//

import Foundation

protocol IAddExpenseViewControllerDelegate {
    func UpdateViewController(info: AddExpenseViewControllerData)
}

struct AddExpenseViewControllerData{
    var _cardName : String
}


extension AddExpenseViewController : IAddExpenseViewControllerDelegate
{
    func UpdateViewController(info: AddExpenseViewControllerData) {
        
        self._cardType.text = info._cardName
        self._cardType.resignFirstResponder()
    }
    
}

