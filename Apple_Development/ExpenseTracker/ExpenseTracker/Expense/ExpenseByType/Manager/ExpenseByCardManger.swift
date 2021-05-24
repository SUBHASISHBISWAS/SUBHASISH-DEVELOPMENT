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

class ExpenseByCardManger {
    
    /*
    static var _typeOfTransactions : [String]={
        return CardManager._cardTypes
    }()
    */
    static let context : NSManagedObjectContext =
        {
            var context : NSManagedObjectContext?
            context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            return context!
        }()
    
    class func GetExpenesByCard(completion: @escaping ([ExpenseByTypeModel]) -> ())
    {
        
        DispatchQueue.global(qos: .userInitiated).async
        {
            var expenseByCard = [ExpenseByTypeModel]()
            for cardName in CardManager._cardNames
            {
            
                let (totalExpenseByMonth,totalExpenseByYear,_,totalExpense) = CardManager.GetExpenseByCard(cardName: cardName, expenseDurations: [.currentMonth,.currentYear,.all])
            
                expenseByCard.append(ExpenseByTypeModel(id: UUID(), description: cardName, image: #imageLiteral(resourceName: "Card BG"),totalAmaount: totalExpense, totalAmaountInCurrentMonth: totalExpenseByMonth,totalAmaountInCurrentYear:totalExpenseByYear,month:Date().month ))
                
                DispatchQueue.main.async
                {
                    completion(expenseByCard)
                }
            }
        
        }
        
    }
    
    class func map(cards : [Card],completion: @escaping ([ExpenseByTypeModel]) -> ())
    {
        
        DispatchQueue.global(qos: .userInitiated).async
        {
            var expenseByType = [ExpenseByTypeModel]()
            for card in cards
            {
                let cardName = card.cardName!
                
                let (currentMonthExpense,currentYearExpense,_,totalExpense) = CardManager.GetExpenseByCard(cardName: cardName, expenseDurations: [.currentMonth,.currentYear,.all])
                
                expenseByType.append(ExpenseByTypeModel(id: UUID(), description: cardName, image: #imageLiteral(resourceName: "Card BG"),totalAmaount: totalExpense, totalAmaountInCurrentMonth: currentMonthExpense,totalAmaountInCurrentYear:currentYearExpense,month:Date().month ))
                
                DispatchQueue.main.async
                {
                    completion(expenseByType)
                }
            }
        
        }
         
       
    }
    
    
    class func GetMonthlyExpenseOfAllCard(completion: @escaping ([ExpenseByTypeModel]) -> (),transactionDate :Date)
    {
        DispatchQueue.global(qos: .userInitiated).async
        {
            var expenseByType = [ExpenseByTypeModel]()
            
            for cardName in CardManager._cardNames
            {
            
                let totalMonthlyExpenseByCards = TotalMonthlyExpenseOfCards(transactionDate: transactionDate)
                
                expenseByType.append(ExpenseByTypeModel(id: UUID(), description: cardName, image: #imageLiteral(resourceName: "Card BG"),totalAmaount: 0, totalAmaountInCurrentMonth: totalMonthlyExpenseByCards[cardName] ?? 0,totalAmaountInCurrentYear:0,month: transactionDate.month ))
                DispatchQueue.main.async
                {
                    completion(expenseByType)
                }
            }
        
        }
    }
   
    
    class func TotalMonthlyExpenseOfCards(transactionDate : Date) -> [String: Double]  {
        
        var expenseByCardName: [String: Double] = [:]
        
        do
        {
            let monthStartDate=transactionDate.startOfMonth()!
            let monthEndDate=transactionDate.endOfMonth()!
            
            let request = Expense.fetchRequest() as NSFetchRequest<Expense>
            let monthPred = NSPredicate(format: "(transactionDate >= %@) AND (transactionDate <= %@)", argumentArray: [monthStartDate,monthEndDate])
            request.predicate = monthPred
            let expenses=try  context.fetch(request)
            
            for cardName in CardManager._cardNames
            {
                expenseByCardName[cardName]=SumOfExpensesByCard(expenses: expenses, transactionType: cardName)
            }
           
            return expenseByCardName
            
        }
        catch{}
        return expenseByCardName
    }
    
    class func SumOfExpensesByCard(expenses : [Expense], transactionType : String) -> Double  {
        
        var sumExpense : Double = 0
        for expense in expenses
        {
            
            if (expense.transactionType == transactionType)
            {
                sumExpense+=expense.amount
            }
            
        }
        return sumExpense
    }
    
    
}
