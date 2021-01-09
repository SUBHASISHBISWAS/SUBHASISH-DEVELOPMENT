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

class MonthlyOverviewManager {
    
    static let _months=["2-1-2021","1-2-2021","1-3-2021","1-4-2021","1-5-2021","1-6-2021","1-7-2021","1-8-2021","1-9-2021","1-10-2021","1-11-2021","1-12-2021",]
    
    static let _expenseDateFormatter: DateFormatter =
        {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "dd-MM-yyyy"
            return dateFormatter
        }()
    
     static let  context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static func getMonthlyOverview(completion: @escaping ([MonthyOveviewModel]) -> ()) {
        // Replace with real data store code
        
        DispatchQueue.global(qos: .userInitiated).async {
            var giftCardModels = [MonthyOveviewModel]()
            
            giftCardModels.append(MonthyOveviewModel(id: UUID(), description: "Seasonal Gift Card 1", image: #imageLiteral(resourceName: "SeasonalGiftCard1"),totalAmaount: 1000))
            giftCardModels.append(MonthyOveviewModel(id: UUID(), description: "Seasonal Gift Card 2", image: #imageLiteral(resourceName: "SeasonalGiftCard2"),totalAmaount: 1000))
            giftCardModels.append(MonthyOveviewModel(id: UUID(), description: "Seasonal Gift Card 3", image: #imageLiteral(resourceName: "SeasonalGiftCard3"),totalAmaount: 1000))
            giftCardModels.append(MonthyOveviewModel(id: UUID(), description: "Seasonal Gift Card 4", image: #imageLiteral(resourceName: "SeasonalGiftCard4"),totalAmaount: 1000))
            giftCardModels.append(MonthyOveviewModel(id: UUID(), description: "Seasonal Gift Card 5", image: #imageLiteral(resourceName: "SeasonalGiftCard5"),totalAmaount: 1000))
            giftCardModels.append(MonthyOveviewModel(id: UUID(), description: "Seasonal Gift Card 6", image: #imageLiteral(resourceName: "SeasonalGiftCard6"),totalAmaount: 1000))
            giftCardModels.append(MonthyOveviewModel(id: UUID(), description: "Seasonal Gift Card 1", image: #imageLiteral(resourceName: "SeasonalGiftCard1"),totalAmaount: 1000))
            giftCardModels.append(MonthyOveviewModel(id: UUID(), description: "Seasonal Gift Card 2", image: #imageLiteral(resourceName: "SeasonalGiftCard2"),totalAmaount: 1000))
            giftCardModels.append(MonthyOveviewModel(id: UUID(), description: "Seasonal Gift Card 3", image: #imageLiteral(resourceName: "SeasonalGiftCard3"),totalAmaount: 1000))
            giftCardModels.append(MonthyOveviewModel(id: UUID(), description: "Seasonal Gift Card 4", image: #imageLiteral(resourceName: "SeasonalGiftCard4"),totalAmaount: 1000))
            giftCardModels.append(MonthyOveviewModel(id: UUID(), description: "Seasonal Gift Card 5", image: #imageLiteral(resourceName: "SeasonalGiftCard5"),totalAmaount: 1000))
            giftCardModels.append(MonthyOveviewModel(id: UUID(), description: "Seasonal Gift Card 6", image: #imageLiteral(resourceName: "SeasonalGiftCard6"),totalAmaount: 1000))
            
            DispatchQueue.main.async {
                completion(giftCardModels)
            }
        }
    }
    
    class func GetMonthlyExpenes(completion: @escaping ([MonthyOveviewModel]) -> ())
    {
        DispatchQueue.global(qos: .userInitiated).async
        {
            var giftCardModels = [MonthyOveviewModel]()
            for month in _months
            {
            
                if let date = _expenseDateFormatter.date(from: month)
                {
                    let totalExpense=GetExpenseByMonth(expenseDate: date)
                    giftCardModels.append(MonthyOveviewModel(id: UUID(), description: date.month, image: #imageLiteral(resourceName: "SeasonalGiftCard1"),totalAmaount: totalExpense))
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
    
    static func getThankYouGiftCards(completion: @escaping ([MonthyOveviewModel]) -> ()) {
        // Replace with real data store code
        
        /*
        DispatchQueue.global(qos: .userInitiated).async {
            var giftCardModels = [GiftCardModel]()
            giftCardModels.append(GiftCardModel(id: UUID(), description: "Thank You Gift Card 1", image: #imageLiteral(resourceName: "ThankYouGiftCard1")))
            giftCardModels.append(GiftCardModel(id: UUID(), description: "Thank You Gift Card 2", image: #imageLiteral(resourceName: "ThankYouGiftCard2")))
            giftCardModels.append(GiftCardModel(id: UUID(), description: "Thank You Gift Card 3", image: #imageLiteral(resourceName: "ThankYouGiftCard3")))
            giftCardModels.append(GiftCardModel(id: UUID(), description: "Thank You Gift Card 4", image: #imageLiteral(resourceName: "ThankYouGiftCard4")))
            
            DispatchQueue.main.async {
                completion(giftCardModels)
            }
        }
 */
    }
}
