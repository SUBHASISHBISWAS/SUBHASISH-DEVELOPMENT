//
//  CardManager.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 18/01/21.
//

import Foundation
import UIKit
import CoreData

class CardManager: NSObject {

    static let  context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static var cards=[Card]()
    static var _cardTypes : [String] = {
        let cardTypes = UserDefaults.standard.object(forKey: defaultsKeys.cardTypes) as? [String]
        return cardTypes ?? []
    }()
    
    class func AddCard(cardName : String, cardNumber : String, cardType : String, cardCvv :Int16, creditLimit : Int64, bankName: String, userName :String, password :String, gracePeriod :Int32,expiryDate :Date, dueDate : Date,statementDate : Date,completion: @escaping ([Card]) -> () ) {
        
        
        DispatchQueue.global(qos: .userInitiated).async
        {
            var cardModels = [Card]()
            cardModels = try!  context.fetch(Card.fetchRequest())
            
            let card=Card(context: context)
            
            card.cardName = cardName
            card.cardNumber = cardNumber
            card.cardType = cardType
            card.cvv = cardCvv
            card.creditLimit = creditLimit
            card.bankName = bankName
            card.userName = userName
            card.password = password
            card.gracePeriod = gracePeriod
            card.expiryDate = expiryDate
            card.dueDate = dueDate
            card.statementDate = statementDate
            card.currentMonthExpense = 0
            card.currentYearExpense = 0
            card.totalExpense = 0
            card.id = UUID()
            let imageData = UIImage(named: "Card BG")?.pngData()
            card.cardImage = imageData
            
            try! self.context.save()
            
            cards.append(card)
            cardModels.append(card)
            _cardTypes.append(card.cardName!)
            UserDefaults.standard.set(_cardTypes, forKey: defaultsKeys.cardTypes)
            DispatchQueue.main.async
            {
               
                completion(cardModels)
            }
        
        }
    }
    
    class func DeleteCard(id :Int,completion: @escaping ([Card]) -> ())
    {
        var cardModels = [Card]()
        cardModels = try!  context.fetch(Card.fetchRequest())
        let cardToRemove=cardModels[id]
        cardModels.remove(at: id)
        self.context.delete(cardToRemove)
        try! self.context.save()
        _cardTypes.remove(at: id)
        UserDefaults.standard.set(_cardTypes, forKey: defaultsKeys.cardTypes)
        completion(cardModels)
        
        /*
        DispatchQueue.global(qos: .userInitiated).async
        {
            var cardModels = [Card]()
            cardModels = try!  context.fetch(Card.fetchRequest())
            let cardToRemove=cardModels[id]
            cardModels.remove(at: id)
            self.context.delete(cardToRemove)
            try! self.context.save()
        
            
            DispatchQueue.main.async
            {
                completion(cardModels)
            }
        
        }
         */
    }
    
    class func GetCards(completion: @escaping ([Card]) -> ())
    {
        var cards = [Card]()
        
        self.cards = try!  context.fetch(Card.fetchRequest())
        cards=self.cards
        completion(cards)
        
        /*
        DispatchQueue.global(qos: .userInitiated).async
        {
            var cards = [Card]()
            
            self.cards = try!  context.fetch(Card.fetchRequest())
            cards=self.cards
            
            DispatchQueue.main.async
            {
                completion(cards)
            }
        
        }
         */
        
    }
    
    class func GetCard(cardName : String, completion:  @escaping (Card) -> ())
    {
        
        var cards = [Card]()
        
        let request = Card.fetchRequest() as NSFetchRequest<Card>
        let trasactionTypePred = NSPredicate(format: "cardName CONTAINS '\(cardName)'")
        request.predicate = trasactionTypePred
        cards=try! context.fetch(request)
        if cards.count == 0 {return}
        completion(cards.first!)
        
        /*
        DispatchQueue.main.async
        {
            
        }
 
        */
        
    }
    
    class func GetExpenseByCardType(cardName : String, expenseDuration : ExpenseDuration , statementDate : Date = Date() ) ->Double
    {
        
        var currentMonthExpense : Double = 0
        var currentYearExpense : Double = 0
        var totalExpense : Double = 0
        let request = Card.fetchRequest() as NSFetchRequest<Card>
        let cardNamePred = NSPredicate(format: "cardName CONTAINS '\(cardName)'")
        request.predicate = cardNamePred
        let cards = try! context.fetch(request)
        if (cards.count == 0){return 0}
        
        let card=cards.first!
        switch expenseDuration {
            case .currentMonth:
                
                
                let originalStatementDate=card.statementDate
                
                let originalStatementDateComponents = Calendar.current.dateComponents([.day, .month,.year],from: originalStatementDate!)
                var currentDateComponents = Calendar.current.dateComponents([.day, .month,.year],from: Date())
                currentDateComponents.day = originalStatementDateComponents.day
                currentDateComponents.month = currentDateComponents.month
                currentDateComponents.year = currentDateComponents.year
                let statementEndDate = Calendar.current.date(from: currentDateComponents)!.dateInLocalTimeZone()
                
                
                let statementStartDate=Calendar.current.date(byAdding: .day, value: -statementEndDate.getDaysInMonth(), to: statementEndDate)
                
                let monthPred = NSPredicate(format: "(transactionDate >= %@) AND (transactionDate <= %@)", argumentArray: [statementStartDate!,statementEndDate])
                let expenses =  card.expenses!.filtered(using: monthPred)
                expenses.forEach { (expense) in
                    guard let expense = expense as? Expense else { return }
                    currentMonthExpense+=expense.amount
                }
                return currentMonthExpense
            
            case .byMonth:
                
                let statementEndDate = statementDate
                let statementStartDate=Calendar.current.date(byAdding: .day, value: -statementEndDate.getDaysInMonth(), to: statementEndDate)
                
                let monthPred = NSPredicate(format: "(transactionDate >= %@) AND (transactionDate <= %@)", argumentArray: [statementStartDate!,statementEndDate])
                let expenses =  card.expenses!.filtered(using: monthPred)
                expenses.forEach { (expense) in
                    guard let expense = expense as? Expense else { return }
                    currentMonthExpense+=expense.amount
                }
                return currentMonthExpense
            case .currentYear:
                
                let startDateOfYear = card.statementDate!.startDateOfTheYear()!
                let lastDateOfYear = card.statementDate!.endDateOfTheYear()!
        
                let monthPred = NSPredicate(format: "(transactionDate >= %@) AND (transactionDate <= %@)", argumentArray: [startDateOfYear,lastDateOfYear])
                let expenses =  card.expenses!.filtered(using: monthPred)
                expenses.forEach { (expense) in
                    guard let expense = expense as? Expense else { return }
                    currentYearExpense+=expense.amount
                }
                return currentYearExpense
                
            case .all:
                card.expenses!.forEach { (expense) in
                    guard let expense = expense as? Expense else { return }
                    totalExpense+=expense.amount
                }
                return totalExpense
           
        }
    
    }
    
    class func getCurrentTimeZone() -> String{

             return TimeZone.current.identifier

      }
}

enum ExpenseDuration {
    case currentMonth
    case byMonth
    case currentYear
    case all
}

struct defaultsKeys {
    static let cardTypes = "cardTypes"

}
