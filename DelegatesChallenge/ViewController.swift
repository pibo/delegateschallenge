//
//  ViewController.swift
//  DelegatesChallenge
//
//  Created by Felipe Ribeiro on 02/10/18.
//  Copyright © 2018 Felipe Ribeiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let cashDelegate = CashTextFieldDelegate()
    
    @IBOutlet var zipTextField: UITextField!
    @IBOutlet var cashTextField: UITextField!
    @IBOutlet var allowEditingSwitch: UISwitch!
    @IBOutlet var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zipTextField.delegate = zipCodeDelegate
        cashTextField.delegate = cashDelegate
    }
    
    @IBAction func dismissKeyboard(_ sender: AnyObject) {
        if !(sender as! UISwitch).isOn {
            nameTextField.resignFirstResponder()
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return allowEditingSwitch.isOn
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

