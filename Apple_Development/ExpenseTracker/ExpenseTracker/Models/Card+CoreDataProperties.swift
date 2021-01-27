//
//  Card+CoreDataProperties.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 19/01/21.
//
//

import Foundation
import CoreData


extension Card {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Card> {
        return NSFetchRequest<Card>(entityName: "Card")
    }

    @NSManaged public var bankName: String?
    @NSManaged public var cardName: String?
    @NSManaged public var cardNumber: String?
    @NSManaged public var cardType: String?
    @NSManaged public var creditLimit: Int64
    @NSManaged public var dueDate: Date?
    @NSManaged public var statementDate: Date?
    @NSManaged public var currentMonthExpense: Double
    @NSManaged public var totalExpense: Double
    @NSManaged public var currentYearExpense: Double
    @NSManaged public var expiryDate: Date?
    @NSManaged public var cvv: Int16
    @NSManaged public var userName: String?
    @NSManaged public var gracePeriod: Int32
    @NSManaged public var id: UUID?
    @NSManaged public var password: String?
    @NSManaged public var cardImage: Data?
    @NSManaged public var expenses: NSSet?

}

// MARK: Generated accessors for expenses
extension Card {

    @objc(addExpensesObject:)
    @NSManaged public func addToExpenses(_ value: Expense)

    @objc(removeExpensesObject:)
    @NSManaged public func removeFromExpenses(_ value: Expense)

    @objc(addExpenses:)
    @NSManaged public func addToExpenses(_ values: NSSet)

    @objc(removeExpenses:)
    @NSManaged public func removeFromExpenses(_ values: NSSet)

}

extension Card : Identifiable {

}
