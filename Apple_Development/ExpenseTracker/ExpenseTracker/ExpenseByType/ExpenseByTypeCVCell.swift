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
    
    func setup(backgroundColor : UIColor, count : Int) {
        self.backgroundColor=backgroundColor
        _totalExpenseLabel.text = "\(count)"
    }
    
    func setup(expenseByType : ExpenseByTypeModel) {
        
        //_totalExpenseLabel.text = "\(monthlyOverviewModel.description)"
        _expenTypeImage.image=expenseByType.image
        _typeOfExpenseLabel.text = expenseByType.description
        
        _totalExpenseLabel.text = "\(expenseByType.totalAmaount)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        _expenTypeImage.layer.cornerRadius = layer.cornerRadius
        layer.shadowOpacity = 1
        layer.shadowOffset=CGSize(width: 1, height: 1)
        
    }
    
}
