//
//  LoginVC+TextFieldDelegate.swift
//  Puzzle
//
//  Created by User on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

// MARK: UITextfield delegate methods

extension LoginVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true;
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        self.activeField = textField;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        self.activeField = nil;
    }
}
