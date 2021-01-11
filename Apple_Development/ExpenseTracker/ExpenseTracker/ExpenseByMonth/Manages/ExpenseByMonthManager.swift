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

class ExpenseByMonthManager {
    
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
                context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            }
            return context!
        }()
    
    
    
    class func GetMonthlyExpenes(completion: @escaping ([ExpenseByMonthModel]) -> ())
    {
        DispatchQueue.global(qos: .userInitiated).async
        {
            var giftCardModels = [ExpenseByMonthModel]()
            for month in _months
            {
            
                if let date = _expenseDateFormatter.date(from: month)
                {
                    let totalExpense=GetExpenseByMonth(expenseDate: date)
                    giftCardModels.append(ExpenseByMonthModel(id: UUID(), description: date.month, image: #imageLiteral(resourceName: "SeasonalGiftCard1"),totalAmaount: totalExpense))
                }
                DispatchQueue.main.async
                {
                    completion(giftCardModels)
                }
            }
        
        }
    }
    class func GetExpenseByMonth(expenseDate : Date) -> Double  {
        
        var totalExpenseByMonth :Double = 0
        do
        {
            let monthStartDate=expenseDate.startOfMonth()!
            let monthEndDate=expenseDate.endOfMonth()!
            
            let request = Expense.fetchRequest() as NSFetchRequest<Expense>
            request.predicate = NSPredicate(format: "(transactionDate >= %@) AND (transactionDate <= %@)", argumentArray: [monthStartDate,monthEndDate])
            
            let expenses=try  context.fetch(request)
            totalExpenseByMonth=GetSumOfExpenses(expenses: expenses)
        }
        catch{}
        return totalExpenseByMonth
    }
    
    class func GetSumOfExpenses(expenses : [Expense]) -> Double  {
        var sumExpense : Double = 0
        for expense in expenses {
            sumExpense+=expense.amount
        }
        return sumExpense
    }
    
    
}
