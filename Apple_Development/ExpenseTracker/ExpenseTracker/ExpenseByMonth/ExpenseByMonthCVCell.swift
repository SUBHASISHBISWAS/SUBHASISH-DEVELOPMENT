//
//  MonthlyExpenseOverViewCellCollectionViewCell.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 08/01/21.
//

import UIKit

class ExpenseByMonthCVCell: UICollectionViewCell {
    
    @IBOutlet weak var _monthsImage: UIImageView!
    @IBOutlet weak var _monthLabel: UILabel!
    @IBOutlet weak var _totalExpenseLabel: UILabel!
    
    func setup(backgroundColor : UIColor, count : Int) {
        self.backgroundColor=backgroundColor
        _totalExpenseLabel.text = "\(count)"
    }
    
    func setup(monthlyOverviewModel : ExpenseByMonthModel) {
        
        //_totalExpenseLabel.text = "\(monthlyOverviewModel.description)"
        _monthsImage.image=monthlyOverviewModel.image
        _monthLabel.text = monthlyOverviewModel.description
        
        _totalExpenseLabel.text = "\(Int(monthlyOverviewModel.totalAmaount))"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        _monthsImage.layer.cornerRadius = layer.cornerRadius
        layer.shadowOpacity = 1
        layer.shadowOffset=CGSize(width: 1, height: 1)
        
    }
}


