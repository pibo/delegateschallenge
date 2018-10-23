//
//  ZipCodeTextFieldDelegate.swift
//  DelegatesChallenge
//
//  Created by Felipe Ribeiro on 02/10/18.
//  Copyright © 2018 Felipe Ribeiro. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Int(string) != nil || string.isEmpty {
            var newText = textField.text! as NSString
            newText = newText.replacingCharacters(in: range, with: string) as NSString
            
            return newText.length <= 5
        }
        
        return false
    }
}
