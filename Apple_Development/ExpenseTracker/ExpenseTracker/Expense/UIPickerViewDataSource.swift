//
//  UIPickerViewDataSource.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 12/01/21.
//

import Foundation
import UIKit

/*
class ExpensePickerViewDataSource : NSObject,UIPickerViewDataSource,UIPickerViewDelegate
{
    var _delegate : IUpdateDateSource?
    
    let _expensePickerViewDataProvider : ExpensePickerViewDataProvider
    
    init(expensePickerViewDataProvider : ExpensePickerViewDataProvider)
    {
        _expensePickerViewDataProvider = expensePickerViewDataProvider
        self._delegate = self._expensePickerViewDataProvider
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return _expensePickerViewDataProvider.numberOfComponents(in: pickerView)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return _expensePickerViewDataProvider.numberOfComponentsInPickerView(pickerView: pickerView)
        }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return _expensePickerViewDataProvider.pickerView(pickerView, numberOfRowsInComponent: component)
        }
    
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return _expensePickerViewDataProvider.pickerView(pickerView, titleForRow: row, forComponent: component)
        }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        _expensePickerViewDataProvider.pickerView(pickerView, didSelectRow: row, inComponent: component)
    }
}

protocol ExpensePickerViewDataProvider : IUpdateDateSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int

    func numberOfComponents(in pickerView: UIPickerView) -> Int
}

*/





