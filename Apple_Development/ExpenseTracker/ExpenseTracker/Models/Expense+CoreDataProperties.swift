//
//  Expense+CoreDataProperties.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 19/01/21.
//
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var amount: Double
    @NSManaged public var id: UUID?
    @NSManaged public var transactionDate: Date?
    @NSManaged public var transactionDescription: String?
    @NSManaged public var transactionType: String?
    @NSManaged public var card: Card?

}

extension Expense : Identifiable {

}
