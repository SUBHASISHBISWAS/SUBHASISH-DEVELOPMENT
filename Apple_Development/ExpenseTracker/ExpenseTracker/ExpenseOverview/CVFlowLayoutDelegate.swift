//
//  ExpenseByMonth.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 12/01/21.
//

import Foundation
import UIKit
import CoreData


extension AddExpenseViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        /*
        let rows : CGFloat = 1
        
        let collectionViewHeight=collectionView.bounds.height
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (rows - 1)
        let adjustedHeight=collectionViewHeight - spaceBetweenCells
        let height : CGFloat = floor(adjustedHeight/rows)
        let width :CGFloat = height/1.5
        return CGSize(width: width, height: height)
         */
        
        
        if (collectionView == _expenseByMonthCView)
        {
            let width=_expenseByMonthCView.bounds.width/_collectionViewDynamicWidhthFactor-50;
            let height=width/1.5
            return CGSize(width: width, height: height)
        }
        if (collectionView == _expenseByTypeCView)
        {
            let width=_expenseByTypeCView.bounds.width/_collectionViewDynamicWidhthFactor-50;
            let height=width/1.5
            return CGSize(width: width, height: height)
        }
        
        
        return CGSize(width: 0, height: 0)
 
    }
}

