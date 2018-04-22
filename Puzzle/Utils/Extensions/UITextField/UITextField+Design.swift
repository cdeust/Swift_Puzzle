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
    public class func designTextfield(textfield:UITextField) -> UITextField {
        textfield.layer.borderColor = UIColor(named: "BlueAlpha20")?.cgColor
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = textfield.frame.size.height / 2
        textfield.layer.shadowColor = UIColor.clear.cgColor
        textfield.layer.shadowOffset = CGSize(width: 0, height: 0)
        textfield.layer.shadowRadius = 0
        textfield.layer.shadowOpacity = 1
        textfield.layer.masksToBounds = false
        textfield.font = UIFont.helveticaNeueRegular()
        textfield.textColor = UIColor.darkGray
        textfield.backgroundColor = UIColor.white
        
        return textfield
    }
}
