//
//  ExpenseTypeDataSource.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 17/05/21.
//

import Foundation
import UIKit

class CVExpenseCardDataSource: NSObject,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,IUpdateDateSource {
    
    
   
    static let shared =  CVExpenseCardDataSource()
    
    let _collectionViewDynamicWidhthFactor :CGFloat = 1.5
    var _expenseByTypes : [ExpenseByTypeModel] = []
    
    private override init() {}
    
    func UpdateDataSource(data: Any?) {
        _expenseByTypes = data as! [ExpenseByTypeModel]
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width=collectionView.bounds.width/_collectionViewDynamicWidhthFactor-50;
        let height=width/1.5
        return CGSize(width: width, height: height)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _expenseByTypes.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "expenseByTypeCell", for: indexPath) as! ExpenseByTypeCVCell
        cell.setup(expenseByType: _expenseByTypes[indexPath.item])
        return cell
    }
    
}
