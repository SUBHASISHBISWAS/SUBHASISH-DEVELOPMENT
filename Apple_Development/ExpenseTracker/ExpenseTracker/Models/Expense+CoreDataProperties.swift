//
//  Expense+CoreDataProperties.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 05/01/21.
//
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var expenseType: String?
    @NSManaged public var amount: Double
    @NSManaged public var expenseMedium: String?

}

extension Expense : Identifiable {

}
