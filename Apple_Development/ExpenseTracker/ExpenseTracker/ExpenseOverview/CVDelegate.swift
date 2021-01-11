//
//  CVDelegate.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 12/01/21.
//

import Foundation
import UIKit

extension AddExpenseViewController:UICollectionViewDelegate
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        if (collectionView == _expenseByTypeCView) {
            return 1
        }
        if (collectionView == _expenseByMonthCView) {
            return 1
        }
        return 1
    }
}
