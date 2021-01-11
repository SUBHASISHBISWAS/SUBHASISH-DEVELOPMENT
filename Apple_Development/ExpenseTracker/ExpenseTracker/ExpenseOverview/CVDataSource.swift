//
//  CVDataSource.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 12/01/21.
//

import Foundation
import UIKit

extension AddExpenseViewController : UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        
            if (collectionView == _expenseByTypeCView)
            {
                return _expenseByTypes.count
            }
            if (collectionView == _expenseByMonthCView)
            {
                return _expenseByMonths.count
            }
        
            return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        if (collectionView == _expenseByMonthCView)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "expenseByMonthCell", for: indexPath) as! ExpenseByMonthCVCell
            cell.setup(monthlyOverviewModel: _expenseByMonths[indexPath.item])
            return cell
        }
        if (collectionView == _expenseByTypeCView)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "expenseByTypeCell", for: indexPath) as! ExpenseByTypeCVCell
            cell.setup(expenseByType: _expenseByTypes[indexPath.item])
            return cell
        }
        
        return UICollectionViewCell()
        
        
        //cell.setup(backgroundColor: _months[indexPath.item], count: indexPath.item)
        //cell.backgroundColor=_colorData[indexPath.item]
        //return cell
    }
}
