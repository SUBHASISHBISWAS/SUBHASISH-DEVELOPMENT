//
//  ExpenseManager.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 05/01/21.
//

import UIKit
import CoreData

class ExpenseManager: NSObject {

    static let  context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static var expenses=[Expense]()
    
    
    let expenseDateFormatter: DateFormatter =
        {
            let expenseDateFormatter = DateFormatter()
            expenseDateFormatter.timeZone = .current
            expenseDateFormatter.locale = .current
            expenseDateFormatter.dateStyle = .medium
            expenseDateFormatter.timeStyle = .none
            expenseDateFormatter.dateFormat = "dd-MMM-yyyy"
            //expenseDateFormatter.timeZone = NSTimeZone(name: "GMT") as TimeZone?
            return expenseDateFormatter
        }()
    
    class func AddExpense(amount :Double, transactionDescription :String, cardName :String , transactionDate : Date) {
        
        var transactionCard : Card?
        CardManager.GetCard(cardName: cardName) { (card) in
            transactionCard=card
        }
        
        let expense=Expense(context: context)
        
        expense.id=UUID()
        expense.amount=amount
        expense.transactionDescription=transactionDescription
        expense.transactionType=cardName
        expense.transactionDate=transactionDate

        var (currentMonthExpense,currentYearExpense,_,totalExpense) = CardManager.GetExpenseByCard(cardName: cardName, expenseDurations: [.currentMonth,.currentYear,.all])
        currentMonthExpense+=amount
        currentYearExpense+=amount
        totalExpense+=amount
        
        transactionCard?.addToExpenses(expense)
        transactionCard?.currentMonthExpense = currentMonthExpense
        transactionCard?.currentYearExpense = currentYearExpense
        transactionCard?.totalExpense = totalExpense
        
        try! self.context.save()
        expenses.append(expense)
    }
    
    class func DeleteExpense(id :Int)
    {
        let expenseToRemove=expenses[id]
        expenses.remove(at: id)
        self.context.delete(expenseToRemove)
        
        try! self.context.save()
        
    }
    
    class func GetExpense(id :Int) -> Expense
    {
        self.expenses = try!  context.fetch(Expense.fetchRequest())
        
        if (expenses.count > 0)
        {
            return expenses[id]
        }
        return Expense()
    }
    
    class func GetExpenses() -> [Expense]
    {
        self.expenses = try!  context.fetch(Expense.fetchRequest())
        
        return expenses
    }
    
    class func GetTotalExpenses()->Double
    {
        var totalExpense : Double=0;
        
        for expense in GetExpenses() {
            totalExpense+=expense.amount
        }
        return totalExpense
    }
    
    class func GetExpenseByMonth(expenseDate : Date) -> Double  {
        
        var totalExpenseByMonth :Double = 0
        let monthStartDate=expenseDate.startOfMonth()!
        let monthEndDate=expenseDate.endOfMonth()!
        
        let request = Expense.fetchRequest() as NSFetchRequest<Expense>
        request.predicate = NSPredicate(format: "(transactionDate >= %@) AND (transactionDate <= %@)", argumentArray: [monthStartDate,monthEndDate])
        let expenses=try!  context.fetch(request)
        
        totalExpenseByMonth=GetSumOfExpenses(expenses: expenses)
        return totalExpenseByMonth
    }
    
    class func GetExpenseByExpensType(transactionType : String) -> Double  {
        
        var totalExpenseByTransactionType :Double = 0
        //let monthStartDate=Date().startOfMonth()
        //let monthEndDate=Date().endOfMonth()
        
        let request = Expense.fetchRequest() as NSFetchRequest<Expense>
        request.predicate=NSPredicate(format: "transactionType CONTAINS '\(transactionType)'")

        let expenses=try! context.fetch(request)
        totalExpenseByTransactionType = GetSumOfExpenses(expenses: expenses)
        
        return totalExpenseByTransactionType
    }
    
    class func GetAllExpenseByMonths() -> Double  {
        return 0
    }
    
    class func GetSumOfExpenses(expenses : [Expense]) -> Double  {
        var sumExpense : Double = 0
        for expense in expenses {
            sumExpense+=expense.amount
        }
        return sumExpense
    }
}
