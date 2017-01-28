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
    public class func designButton(button: UIButton) -> UIButton
    {
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.tintColor = UIColor.gray
        
        return button
    }
    
    public class func createWithTitleTargetAction(title: String, target: Any, action: Selector) -> UIButton
    {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.borderColor = UIColor.gray.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 5
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor.gray, for: .normal)
        btn.addTarget(target, action: action, for: .touchUpInside)
        
        return btn
    }
}
