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
        //_totalExpenseLabel.text = "\(count)"
    }
    
    func setup(expenseByType : ExpenseByTypeModel) {
        
        transactionAmount.text = "\(expenseByType.totalAmaountInCurrentMonth)"
        //_expenTypeImage.image=expenseByType.image
        transactionType.text = expenseByType.description
        
       // _totalExpenseLabel.text = ": " + "\(Int(expenseByType.totalAmaount))"
        //_currentMonthTotalAmaountLabel.text = ": " + "\(Int(expenseByType.totalAmaountInCurrentMonth))"
        //_currentMonthLabel.text = expenseByType.month
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        //_expenTypeImage.layer.cornerRadius = layer.cornerRadius
        layer.shadowOpacity = 1
        layer.shadowOffset=CGSize(width: 1, height: 1)
        
    }
    
}
