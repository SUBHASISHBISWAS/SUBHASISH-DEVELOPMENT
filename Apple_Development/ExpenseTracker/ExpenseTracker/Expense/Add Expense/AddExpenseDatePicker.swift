//
//  CVDelegate.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 12/01/21.
//

import Foundation
import UIKit

extension AddExpenseViewController : UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.openDatePicker(textField : textField)
    }
    
    func openDatePicker(textField : UITextField) {
        
        let datePicker=TextFieldDatePicker()
        datePicker._textField = textField
        datePicker._datePicker = datePicker
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
        datePicker.addTarget(self,action : #selector(self.dateChanged(sender :)),for : .valueChanged)
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        toolBar.sizeToFit()
        
        let doneButton=DatePickerUIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(datePickerButtonPressed(sender :)))
        doneButton._textField = textField
        doneButton._datePicker = datePicker
        doneButton._buttonName = "Done"
        let cancelButton=DatePickerUIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(datePickerButtonPressed(sender :)))
        cancelButton._textField = textField
        cancelButton._datePicker = datePicker
        cancelButton._buttonName = "Cancel"
        let todayButton=DatePickerUIBarButtonItem(title: "Today", style: .plain, target: self, action: #selector(datePickerButtonPressed(sender :)))
        todayButton._textField = textField
        todayButton._datePicker = datePicker
        todayButton._buttonName = "Today"
        let flexibleButton=UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelButton,flexibleButton,todayButton,flexibleButton,doneButton], animated: false)
        
        textField.inputView = datePicker
        textField.inputAccessoryView = toolBar;
        
    
    }
    
    @objc func dateChanged(sender: TextFieldDatePicker)
    {
        sender._textField!.text = DateExtension.cardDateFormatter.string(from: sender._datePicker!.date)
    }
    
    @objc func datePickerButtonPressed(sender: DatePickerUIBarButtonItem){
        
        switch sender._buttonName {
            case "Done":
                sender._textField!.text = DateExtension.cardDateFormatter.string(from: sender._datePicker!.date)
            case "Cancel":
                sender._textField!.text = sender._textField!.text
            case "Today":
                sender._textField!.text = DateExtension.cardDateFormatter.string(from: Date())
            default:
                sender._textField!.text = DateExtension.cardDateFormatter.string(from: sender._datePicker!.date)
            
        }
        self.view.endEditing(true)
    }
}
