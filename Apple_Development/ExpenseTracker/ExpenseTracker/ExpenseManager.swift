//
//  ExpenseManager.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 05/01/21.
//

import UIKit

class ExpenseManager: NSObject {

    static let  context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static var expenses=[Expense]()
    
    class func AddExpense(amount :Double, expenseType :String, expenseMedium :String) {
        let expense=Expense(context: context)
        expense.amount=amount
        expense.expenseType=expenseType
        expense.expenseMedium=expenseMedium
        do
        {
            try self.context.save()
            expenses.append(expense)
        }
        catch{}
    }
    
    class func DeleteExpense(id :Int)
    {
        let expenseToRemove=expenses[id]
        expenses.remove(at: id)
        self.context.delete(expenseToRemove)
        
        do
        {
            try self.context.save()
        }
        catch{}
        
    }
    
    class func GetExpense(id :Int) -> Expense
    {
        do
        {
            self.expenses = try  context.fetch(Expense.fetchRequest())
        }
        catch{}
        
        if (expenses.count > 0)
        {
            return expenses[id]
        }
        return Expense()
    }
    
    class func GetExpenses() -> [Expense]
    {
        do
        {
            self.expenses = try  context.fetch(Expense.fetchRequest())
        }
        catch{}
        
        return expenses
    }
}
