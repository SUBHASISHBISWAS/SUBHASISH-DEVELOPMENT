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

class ExpenseByTypeManger {
    
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
    
    class func GetExpenesByTranctaionType(completion: @escaping ([ExpenseByTypeModel]) -> ())
    {
        DispatchQueue.global(qos: .userInitiated).async
        {
            var expenseByType = [ExpenseByTypeModel]()
            for transactionType in CardManager._cardTypes
            {
            
                let (totalExpenseByMonth,totalExpenseByYear,totalExpense)=AllExpenseByCardType(transactionType: transactionType)
                expenseByType.append(ExpenseByTypeModel(id: UUID(), description: transactionType, image: #imageLiteral(resourceName: "Card BG"),totalAmaount: totalExpense, totalAmaountInCurrentMonth: totalExpenseByMonth,totalAmaountInCurrentYear:totalExpenseByYear,month:Date().month ))
                DispatchQueue.main.async
                {
                    completion(expenseByType)
                }
            }
        
        }
    }
    
    class func map(cards : [Card],completion: @escaping ([ExpenseByTypeModel]) -> ())
    {
        DispatchQueue.global(qos: .userInitiated).async
        {
            var expenseByType = [ExpenseByTypeModel]()
            var currentMonthExpense : Double = 0
            var currentYearExpense : Double = 0
            var totalExpense : Double = 0
            for card in cards
            {
                let transactionType = card.cardName!
                
                GetExpenseByExpenseDuration(transactionType: transactionType, expenseDuration: .currentMonth) { (transactionType,expenseDuration) -> () in
                    currentMonthExpense = CardManager.GetExpenseByCardType(cardName: transactionType, expenseDuration: expenseDuration)
                }
                
                GetExpenseByExpenseDuration(transactionType: transactionType, expenseDuration: .currentYear) { (transactionType,expenseDuration) -> () in
                    currentYearExpense = CardManager.GetExpenseByCardType(cardName: transactionType, expenseDuration: expenseDuration)
                }
                
                GetExpenseByExpenseDuration(transactionType: transactionType, expenseDuration: .all) { (transactionType,expenseDuration) -> () in
                    totalExpense = CardManager.GetExpenseByCardType(cardName: transactionType, expenseDuration: expenseDuration)
                }
                
                
                expenseByType.append(ExpenseByTypeModel(id: UUID(), description: transactionType, image: #imageLiteral(resourceName: "Card BG"),totalAmaount: totalExpense, totalAmaountInCurrentMonth: currentMonthExpense,totalAmaountInCurrentYear:currentYearExpense,month:Date().month ))
                
                DispatchQueue.main.async
                {
                    completion(expenseByType)
                }
            }
        
        }
    }
    
    
    class func GetExpenseOfAllTypeByMonth(completion: @escaping ([ExpenseByTypeModel]) -> (),transactionDate :Date)
    {
        DispatchQueue.global(qos: .userInitiated).async
        {
            var expenseByType = [ExpenseByTypeModel]()
            
            for transactionType in CardManager._cardTypes
            {
            
                let totalExpenseByTransactionType = ExpenseOfAllTypeByMonth(transactionDate: transactionDate)
                expenseByType.append(ExpenseByTypeModel(id: UUID(), description: transactionType, image: #imageLiteral(resourceName: "Card BG"),totalAmaount: 0, totalAmaountInCurrentMonth: totalExpenseByTransactionType[transactionType] ?? 0,totalAmaountInCurrentYear:0,month: transactionDate.month ))
                DispatchQueue.main.async
                {
                    completion(expenseByType)
                }
            }
        
        }
    }
    /*
    class func ExpenseByExpensType(transactionType : String) -> Double  {
        
        var totalExpenseByTransactionType :Double = 0
        
        let request = Expense.fetchRequest() as NSFetchRequest<Expense>
        request.predicate=NSPredicate(format: "transactionType CONTAINS '\(transactionType)'")
        
        let expenses=try! context.fetch(request)
        totalExpenseByTransactionType = SumOfExpenses(expenses: expenses)
        
        return totalExpenseByTransactionType
    }
    */
    
    /*
    class func UpdateTransactionTypeModel(completion: @escaping ([ExpenseByTypeModel]) -> ())
    {
        var expenseByType = [ExpenseByTypeModel]()
        for transactionType in CardManager._cardTypes
        {
        
            let (totalExpenseByMonth,totalExpenseByYear,totalExpense)=AllExpenseByCardType(transactionType: transactionType)
            expenseByType.append(ExpenseByTypeModel(id: UUID(), description: transactionType, image: #imageLiteral(resourceName: "Card BG"),totalAmaount: totalExpense, totalAmaountInCurrentMonth: totalExpenseByMonth,totalAmaountInCurrentYear:totalExpenseByYear,month:Date().month ))
            completion(expenseByType)
        }
    }
    */
    
    /*
    class func SumOfExpenses(expenses : [Expense]) -> Double  {
        var sumExpense : Double = 0
        for expense in expenses {
            sumExpense+=expense.amount
        }
        return sumExpense
    }
    */
    
    
    private class func AllExpenseByCardType(transactionType : String) -> (Double,Double,Double)  {
        
        var totalExpenseByMonth :Double = 0
        var totalExpenseByYear :Double = 0
        var totalExpense :Double = 0
        totalExpenseByMonth = CardManager.GetExpenseByCardType(cardName: transactionType, expenseDuration: .currentMonth)
        totalExpenseByYear = CardManager.GetExpenseByCardType(cardName: transactionType, expenseDuration: .currentYear)
        totalExpense = CardManager.GetExpenseByCardType(cardName: transactionType, expenseDuration: .all)
        return (totalExpenseByMonth, totalExpenseByYear,totalExpense)
        
        
    }
    
    private class func GetExpenseByExpenseDuration(transactionType : String, expenseDuration : ExpenseDuration, getExpense: (String, ExpenseDuration)->())  {
        
        getExpense(transactionType,.currentYear)

    }
    
    class func ExpenseOfAllTypeByMonth(transactionDate : Date) -> [String: Double]  {
        
        var expenseByType: [String: Double] = [:]
        
        do
        {
            let monthStartDate=transactionDate.startOfMonth()!
            let monthEndDate=transactionDate.endOfMonth()!
            
            let request = Expense.fetchRequest() as NSFetchRequest<Expense>
            let monthPred = NSPredicate(format: "(transactionDate >= %@) AND (transactionDate <= %@)", argumentArray: [monthStartDate,monthEndDate])
            request.predicate = monthPred
            let expenses=try  context.fetch(request)
            
            for transactioType in CardManager._cardTypes
            {
                expenseByType[transactioType]=SumOfExpensesByType(expenses: expenses, transactionType: transactioType)
            }
           
            return expenseByType
            
        }
        catch{}
        return expenseByType
    }
    
    class func SumOfExpensesByType(expenses : [Expense], transactionType : String) -> Double  {
        
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
