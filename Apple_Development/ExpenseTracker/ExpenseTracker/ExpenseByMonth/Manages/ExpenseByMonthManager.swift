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
    
    static let _monthNumbers=[1,2,3,4,5,6,7,8,9,10,11,12]
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
            
                if let date = _expenseDateFormatter.date(from: month)?.dateInLocalTimeZone()
                {
                    let totalExpense=GetExpenseByMonth(expenseDate: date)
                    giftCardModels.append(ExpenseByMonthModel(id: UUID(), transactionDate: date, image: #imageLiteral(resourceName: "SeasonalGiftCard1"),totalAmaount: totalExpense))
                }
                DispatchQueue.main.async
                {
                    completion(giftCardModels)
                }
            }
        
        }
    }
    private class func GetExpenseByMonth(expenseDate : Date) -> Double  {
        
        var currentMonthTotalExpense : Double = 0
        
        CardManager.GetCards { (cards) in
            
            for card in cards
            {
                var statementsDates : [Date]?=[]
                let originalStatementDate=card.statementDate!
                var components = Calendar.current.dateComponents([.day, .month,.year],from: originalStatementDate)
                
                for monthNumber in _monthNumbers {
                    
                    components.month = monthNumber
                    components.year = components.year
                    components.day = components.day
                    
                    let date = Calendar.current.date(from: components)!.dateInLocalTimeZone()
                    statementsDates?.append(date)
                    print(date)
                }
                
                for statementDate in statementsDates! {
                    let expenseMonth = Calendar.current.dateComponents([.day, .month,.year],from: expenseDate).month
                    let statementMonth = Calendar.current.dateComponents([.day, .month,.year],from: statementDate).month
                    
                    if (expenseMonth == statementMonth) {
                        currentMonthTotalExpense+=CardManager.GetExpenseByCardType(cardName: card.cardName!, expenseDuration: .byMonth,statementDate: statementDate)
                    }
                }
                
                
            }
        }
        
        return currentMonthTotalExpense
        
    }
    
    private class func GetSumOfExpenses(expenses : [Expense]) -> Double  {
        var sumExpense : Double = 0
        for expense in expenses {
            sumExpense+=expense.amount
        }
        return sumExpense
    }
    
    
}
