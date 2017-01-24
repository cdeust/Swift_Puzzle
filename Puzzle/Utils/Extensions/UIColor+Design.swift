//
//  UIColor+Design.swift
//  Puzzle
//
//  Created by Clément DEUST on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    public class func getColorForSuccess() -> UIColor
    {
        return UIColor.green
    }
    
    public class func getColorForFailure() -> UIColor
    {
        return UIColor.red
    }
    
    public class func designTextfieldWithOkColor() -> UIColor
    {
        return UIColor.clear
    }
    
    public class func designTextfieldWithErrorColor() -> UIColor
    {
        return UIColor.red
    }
}
