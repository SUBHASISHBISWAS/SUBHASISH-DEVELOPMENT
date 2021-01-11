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
    
    static let _typeOfTransactions = ["Cash", "Card", "HDFC", "ICICI"]
    
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
            
                let totalExpense=GetExpenseByExpensType(transactionType: transactionType)
                expenseByType.append(ExpenseByTypeModel(id: UUID(), description: transactionType, image: #imageLiteral(resourceName: "SeasonalGiftCard1"),totalAmaount: totalExpense))
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
           
            //let expenses=try context.fetch(request)
            //totalExpenseByTransactionType = GetSumOfExpenses(expenses: expenses)
            
        }
        catch{}
        
        return totalExpenseByTransactionType
    }
    
    
    class func GetSumOfExpenses(expenses : [Expense]) -> Double  {
        var sumExpense : Double = 0
        for expense in expenses {
            sumExpense+=expense.amount
        }
        return sumExpense
    }
    
    
}
