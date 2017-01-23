//
//  UITextField+Design.swift
//  Puzzle
//
//  Created by Clément DEUST on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    public func designTextfield(textfield:UITextField) -> UITextField
    {
        textfield.layer.borderColor = UIColor.clear.cgColor
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 5
        textfield.font = UIFont().sofiaProRegular()
        textfield.textColor = UIColor.darkGray
        
        return textfield
    }
}
