//
//  ExpenseByTypeModel.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 11/01/21.
//

import Foundation
import UIKit

struct ExpenseByTypeModel {
    var id: UUID
    var description: String
    var image: UIImage
    var totalAmaount : Double
    var totalAmaountInCurrentMonth : Double
    var totalAmaountInCurrentYear : Double
    var month : String
}
