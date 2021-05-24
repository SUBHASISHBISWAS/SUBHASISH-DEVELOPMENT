//
//  ExpenseByTypeCVCell.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 11/01/21.
//

import UIKit

class ExpenseByTypeCVCell: UICollectionViewCell {
    
    @IBOutlet weak var _expenTypeImage: UIImageView!
    @IBOutlet weak var _typeOfExpenseLabel: UILabel!
    @IBOutlet weak var _totalExpenseLabel: UILabel!
    @IBOutlet weak var _currentMonthLabel: UILabel!
    @IBOutlet weak var _currentMonthTotalAmaountLabel: UILabel!
    
    @IBOutlet weak var _currentYearExpense: UILabel!
    func setup(backgroundColor : UIColor, count : Int) {
        self.backgroundColor=backgroundColor
        _totalExpenseLabel.text = "\(count)"
    }
    
    func setup(expenseByType : ExpenseByTypeModel) {
        
        self.layoutIfNeeded()
        _expenTypeImage.image=expenseByType.image
        _typeOfExpenseLabel.text = expenseByType.description
        _totalExpenseLabel.text = "\(Int(expenseByType.totalAmaount))"
        _currentMonthTotalAmaountLabel.text = "\(Int(expenseByType.totalAmaountInCurrentMonth))"
        _currentYearExpense.text = "\(Int(expenseByType.totalAmaountInCurrentYear))"
        _currentMonthLabel.text = expenseByType.month
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        _expenTypeImage.layer.cornerRadius = layer.cornerRadius
        layer.shadowOpacity = 1
        layer.shadowOffset=CGSize(width: 1, height: 1)
        
    }
    
}
