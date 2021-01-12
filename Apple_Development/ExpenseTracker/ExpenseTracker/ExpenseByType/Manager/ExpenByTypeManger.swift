//
//  GiftCardFunctions.swift
//  WiredBrainCoffee
//
//  Created by Mark Moeykens on 12/10/18.
//  Copyright © 2018 Mark Moeykens. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class ExpenByTypeManger {
    
    static let _typeOfTransactions = ["Cash", "HDFC", "ICICI","AMEX","CITY","RBL","INDUS","SC"]
    
    static let _months=["2-1-2021","1-2-2021","1-3-2021","1-4-2021","1-5-2021","1-6-2021","1-7-2021","1-8-2021","1-9-2021","1-10-2021","1-11-2021","1-12-2021",]
    
    static let _expenseDateFormatter: DateFormatter =
        {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "dd-MM-yyyy"
            return dateFormatter
        }()
    
    static let context : NSManagedObjectContext =
        {
            var context : NSManagedObjectContext?
            context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            DispatchQueue.main.async
            {
                //context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            }
            return context!
        }()
    
    //static let  context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    class func GetExpenesByTranctaionType(completion: @escaping ([ExpenseByTypeModel]) -> ())
    {
        DispatchQueue.global(qos: .userInitiated).async
        {
            var expenseByType = [ExpenseByTypeModel
            ]()
            for transactionType in _typeOfTransactions
            {
            
                let (totalExpenseByTransactionType, totalExpenseByMonth)=GetExpenseByTypeInCurrentMonth(transactionType: transactionType)
                expenseByType.append(ExpenseByTypeModel(id: UUID(), description: transactionType, image: #imageLiteral(resourceName: "SeasonalGiftCard1"),totalAmaount: totalExpenseByTransactionType, totalAmaountInCurrentMonth: totalExpenseByMonth,month:Date().month ))
                DispatchQueue.main.async
                {
                    completion(expenseByType)
                }
            }
        
        }
    }
    
    
    
    
    class func GetExpenseByExpensType(transactionType : String) -> Double  {
        
        var totalExpenseByTransactionType :Double = 0
        
        do
        {
            //let monthStartDate=Date().startOfMonth()
            //let monthEndDate=Date().endOfMonth()
            
            let request = Expense.fetchRequest() as NSFetchRequest<Expense>
            request.predicate=NSPredicate(format: "transactionType CONTAINS '\(transactionType)'")
            
            let expenses=try? context.fetch(request)
            totalExpenseByTransactionType = GetSumOfExpenses(expenses: expenses!)
            
        }
        catch{}
        
        return totalExpenseByTransactionType
    }
    
    
    
    class func GetExpenseByTypeInCurrentMonth(transactionType : String) -> (Double,Double)  {
        
        var totalExpenseByMonth :Double = 0
        var totalExpenseByTransactionType :Double = 0
        do
        {
            let monthStartDate=Date().startOfMonth()!
            let monthEndDate=Date().endOfMonth()!
            
            let request = Expense.fetchRequest() as NSFetchRequest<Expense>
            let trasactionTypePred = NSPredicate(format: "transactionType CONTAINS '\(transactionType)'")
            request.predicate = trasactionTypePred
            var expenses=try  context.fetch(request)
            totalExpenseByTransactionType=GetSumOfExpenses(expenses: expenses)
            
            let monthPred = NSPredicate(format: "(transactionDate >= %@) AND (transactionDate <= %@)", argumentArray: [monthStartDate,monthEndDate])
            let compoundPred = NSCompoundPredicate(andPredicateWithSubpredicates: [monthPred, trasactionTypePred])
            request.predicate = compoundPred
            
            expenses=try  context.fetch(request)
            totalExpenseByMonth=GetSumOfExpenses(expenses: expenses)
            
            return (totalExpenseByTransactionType, totalExpenseByMonth)
            
        }
        catch{}
        return (totalExpenseByTransactionType, totalExpenseByMonth)
    }
    
    
    class func GetSumOfExpenses(expenses : [Expense]) -> Double  {
        var sumExpense : Double = 0
        for expense in expenses {
            sumExpense+=expense.amount
        }
        return sumExpense
    }
    
    
}
