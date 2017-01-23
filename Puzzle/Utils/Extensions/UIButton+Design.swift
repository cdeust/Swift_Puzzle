//
//  UIButton+Design.swift
//  Puzzle
//
//  Created by Clément DEUST on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    public func designButton(button: UIButton) -> UIButton
    {
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.tintColor = UIColor.gray
        
        return button
    }
}
