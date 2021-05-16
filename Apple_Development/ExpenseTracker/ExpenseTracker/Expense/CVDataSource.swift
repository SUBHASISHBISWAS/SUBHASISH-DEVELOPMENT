//
//  CVDataSource.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 12/01/21.
//

import Foundation
import UIKit

/*
class ExpenseDataSource: NSObject,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    var _delegate : IUpdateDateSource?
    
    var _expenseDataProvider : IExpenseDataProvider?
    
     init(expenseDataProvider : IExpenseDataProvider) {
        self._expenseDataProvider=expenseDataProvider
        self._delegate = self._expenseDataProvider
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _expenseDataProvider!.collectionView(collectionView, numberOfItemsInSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return _expenseDataProvider!.collectionView(collectionView, cellForItemAt: indexPath)
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return _expenseDataProvider!.numberOfSections(in: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return _expenseDataProvider!.collectionView(collectionView, layout: collectionViewLayout, sizeForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        _expenseDataProvider!.collectionView(collectionView, didSelectItemAt: indexPath)
    }
}

protocol IExpenseDataProvider : IUpdateDateSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    
    func numberOfSections(in collectionView: UICollectionView) -> Int

}
*/

/*
class ExpenseByMonthDataProvider: IExpenseDataProvider {
    func UpdateDataSource(data: Any?) {
        _expenseByMonths = data as! [ExpenseByMonthModel]
    }
    
    let _collectionViewDynamicWidhthFactor :CGFloat = 1.5;
    var _expenseByMonths : [ExpenseByMonthModel]
    
    init(expenseByMonths :[ExpenseByMonthModel]) {
        self._expenseByMonths = expenseByMonths
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width=collectionView.bounds.width/_collectionViewDynamicWidhthFactor-50;
        let height=width/1.5
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _expenseByMonths.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        /*
        let yearlyExpenseViewController = storyboard?.instantiateViewController(identifier: "monthlyExpenseTypeOverview") as? MonthlyExpenseByTypeCollectionView
        yearlyExpenseViewController?.transactionDate = _expenseByMonths[indexPath.item].transactionDate
        self.navigationController?.pushViewController(yearlyExpenseViewController!, animated: true)
         */
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "expenseByMonthCell", for: indexPath) as! ExpenseByMonthCVCell
        cell.setup(monthlyOverviewModel: _expenseByMonths[indexPath.item])
        return cell
    }
    
}
 
 */

/*
class ExpenseTypeDataProvider: IExpenseDataProvider {
    func UpdateDataSource(data: Any?) {
        _expenseByTypes = data as! [ExpenseByTypeModel]
    }
    
    
    let _collectionViewDynamicWidhthFactor :CGFloat = 1.5;
    var _expenseByTypes : [ExpenseByTypeModel]
    
    init(expenseByTypes :[ExpenseByTypeModel]) {
        self._expenseByTypes = expenseByTypes
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
*/

/*
class ExpenseByTypeByMonthDataProvider : IExpenseDataProvider
{
    func UpdateDataSource(data: Any?) {
        _expenseByTypes = data as! [ExpenseByTypeModel]
    }
    
    var _expenseByTypes = [ExpenseByTypeModel]()
    var colorData = [#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1),#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1),#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1),#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1),#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1),#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1),#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)]
    
    init(expenseByTypes : [ExpenseByTypeModel]) {
        self._expenseByTypes = expenseByTypes
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExpenseCell", for: indexPath) as! MonthlyExpenseByTypeCollectionViewCell
        cell.backgroundColor=colorData[indexPath.item]
        cell.setup(expenseByType: _expenseByTypes[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _expenseByTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let columns : CGFloat = 2
        let collectionViewWidth=collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
        let sectionInsects=flowLayout.sectionInset.left + flowLayout.sectionInset.right
        let adjustedWidth=collectionViewWidth - spaceBetweenCells - sectionInsects
        let width : CGFloat = floor(adjustedWidth/columns)
        return CGSize(width: width, height: width/1.5)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
}
*/



class ExpenseDataSource_1: NSObject {
    var _delegate : IUpdateDateSource?
}

protocol IUpdateDateSource {
    func UpdateDataSource(data : Any?) -> ()
}
