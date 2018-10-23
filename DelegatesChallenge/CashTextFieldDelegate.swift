//
//  CashTextFieldDelegate.swift
//  DelegatesChallenge
//
//  Created by Felipe Ribeiro on 02/10/18.
//  Copyright © 2018 Felipe Ribeiro. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if Int(string) != nil || string.isEmpty {
            var newValue = textField.text! as NSString
            newValue = newValue.replacingCharacters(in: range, with: string) as NSString
            
            let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
            let onlyNumbers = regex.stringByReplacingMatches(in: newValue as String, options: .reportProgress, range: NSRange(location: 0, length: newValue.length), withTemplate: "")
            let raw = (Double(onlyNumbers) ?? 0) / 100 as NSNumber
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.currencySymbol = "$ "
            
            textField.text = formatter.string(from: raw)
        }
        
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text!.isEmpty {
            textField.text = "$ 0.00"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
