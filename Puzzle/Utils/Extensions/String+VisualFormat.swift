//
//  String+VisualFormat.swift
//  Puzzle
//
//  Created by User on 25/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

extension String {
    public func getDynamicVerticalVisualFormat(verticalValue: Int) -> String
    {
        return String(format: "V:|-(%i)-[element(30)]", verticalValue)
    }
    
    public func getVerticalVisualFormatBottom() -> String
    {
        return String(format: "V:[element(30)]-(25)-|")
    }
    
    public func getVerticalVisualFormatTop() -> String
    {
        return String(format: "V:|-(80)-[element(30)]")
    }
    
    public func getHorizontalVisualFormatCenter() -> String
    {
        return String(format: "H:|-(25)-[element]-(25)-|")
    }
}
