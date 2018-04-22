//
//  UIView+Design.swift
//  Puzzle
//
//  Created by Clément DEUST on 21/04/2018.
//  Copyright © 2018 cdeust. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public class func designViewBox(view: UIView) -> UIView {
        view.layer.borderColor = UIColor(named: "BlueAlpha20")?.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor(named: "BlueAlpha20")
        return view
    }
}
