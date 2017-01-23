//
//  LoginVD.swift
//  Puzzle
//
//  Created by User on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

// MARK: Color methods

class LoginVD: NSObject {
    func designTextfieldWithOkColor() -> CGColor
    {
        return UIColor.clear.cgColor
    }
    
    func designTextfieldWithErrorColor() -> CGColor
    {
        return UIColor.red.cgColor
    }
    
    func getColorForSuccess() -> UIColor
    {
        return UIColor.green
    }
    
    func getColorForFailure() -> UIColor
    {
        return UIColor.red
    }
}

// MARK: Design UIElements

extension LoginVD {
    func designTextfield(textfield:UITextField) -> UITextField
    {
        textfield.layer.borderColor = UIColor.clear.cgColor
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 5
        textfield.font = UIFont (name: "Sofia Pro Regular", size: 12)
        textfield.textColor = UIColor.darkGray
        
        return textfield
    }
    
    func designLabel(label: UILabel) -> UILabel
    {
        label.font = UIFont (name: "Sofia Pro Regular", size: 12)
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.darkGray
        
        return label
    }
    
    func designErrorLabel(label: UILabel) -> UILabel
    {
        label.font = UIFont (name: "Sofia Pro Regular", size: 12)
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.red
        
        return label
    }
    
    func designButton(button: UIButton) -> UIButton
    {
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.tintColor = UIColor.gray
        
        return button
    }
}

// MARK: App initialization

extension LoginVD {
    func doBaseInitialization() -> Void
    {
        
    }
}
