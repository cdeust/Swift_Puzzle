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
    public func getColorForSuccess() -> UIColor
    {
        return UIColor.green
    }
    public func getColorForFailure() -> UIColor
    {
        return UIColor.red
    }
    public func designTextfieldWithOkColor() -> UIColor
    {
        return UIColor.clear
    }
    public func designTextfieldWithErrorColor() -> UIColor
    {
        return UIColor.red
    }
}
