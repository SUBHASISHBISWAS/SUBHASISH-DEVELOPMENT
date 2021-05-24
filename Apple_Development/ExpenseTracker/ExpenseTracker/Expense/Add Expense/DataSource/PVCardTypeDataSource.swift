//
//  TransactionTypePickerViewDataSource.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 17/05/21.
//

import Foundation
import UIKit

class PVCardTypeDataSource: NSObject,UIPickerViewDataSource,UIPickerViewDelegate {
    
    var _delegate : IAddExpenseViewControllerDelegate?
    
    static let shared =  PVCardTypeDataSource()
    
    var _data : [Card] = []
    
    //let _viewController : UIViewController
    
    /*
    init(data : [Card],viewController : UIViewController) {
        _data=data
        _viewController = viewController
    }
 */
    
    private override init() {}
    
    func UpdateDataSource(data: Any?) {
        _data = data as! [Card]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return _data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return _data[row].cardName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //let viewController = _viewController as! AddExpenseViewController
        //viewController._cardType.text = _data[row].cardName
        //viewController._cardType.resignFirstResponder()
        
        let addExpenseControllerData = AddExpenseViewControllerData.init(_cardName: _data[row].cardName!)
        _delegate?.UpdateViewController(info: addExpenseControllerData)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
}
