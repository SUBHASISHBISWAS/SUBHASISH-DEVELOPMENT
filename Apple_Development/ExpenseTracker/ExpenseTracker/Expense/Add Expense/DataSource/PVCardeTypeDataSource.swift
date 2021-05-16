//
//  CardeTypePickerViewDataSource.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 17/05/21.
//

import Foundation
import UIKit

class PVCardeTypeDataSource: NSObject,UIPickerViewDataSource,UIPickerViewDelegate {
    func UpdateDataSource(data: Any?) {
        _data = data as! [String]
    }
    
    
    var _data : [String]
    let _viewController : UIViewController
    init(data : [String],viewController : UIViewController) {
        _data=data
        _viewController = viewController
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return _data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return _data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let viewController = _viewController as! AddCardViewController
        viewController._cardTypeText.text = _data[row]
        viewController._cardTypeText.resignFirstResponder()
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
}

