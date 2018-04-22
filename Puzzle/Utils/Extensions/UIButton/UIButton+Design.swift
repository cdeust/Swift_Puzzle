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
    public class func designButtonNormal(button: UIButton) -> UIButton {
        button.layer.borderColor = UIColor(named: "Blue")?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = button.frame.height / 2
        button.layer.shadowColor = UIColor(named: "Grey")?.cgColor
        button.layer.shadowRadius = 2
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 1
        button.backgroundColor = UIColor(named: "Blue")
        button.tintColor = UIColor.white
        return button
    }
    
    public class func createWithTitleTargetAction(title: String, target: Any, action: Selector) -> UIButton {
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
