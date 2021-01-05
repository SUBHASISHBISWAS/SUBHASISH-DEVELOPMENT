//
//  Expense.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 05/01/21.
//

import UIKit

class Expense_1: NSObject {

    var amount: Double?
    var expenseType: String?
    
    init(amount :Double, expenseType :String)
    {
        self.amount=amount
        self.expenseType=expenseType
    }
    
    override init() {
        super.init()
    }
}
