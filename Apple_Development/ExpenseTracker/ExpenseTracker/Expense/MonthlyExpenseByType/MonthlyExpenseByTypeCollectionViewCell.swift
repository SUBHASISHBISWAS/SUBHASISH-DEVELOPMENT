//
//  MonthlyExpenseByTypeCollectionViewCell.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 14/01/21.
//

import UIKit

class MonthlyExpenseByTypeCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var transactionAmount: UILabel!
    @IBOutlet weak var transactionType: UILabel!
    func setup(backgroundColor : UIColor, count : Int) {
        self.backgroundColor=backgroundColor
    }
    
    func setup(expenseByType : ExpenseByTypeModel) {
        
        transactionAmount.text = "\(expenseByType.totalAmaountInCurrentMonth)"
        transactionType.text = expenseByType.description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        layer.shadowOpacity = 1
        layer.shadowOffset=CGSize(width: 1, height: 1)
        
    }
    
}
