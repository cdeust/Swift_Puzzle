//
//  UIFont+SofiaPro.swift
//  Puzzle
//
//  Created by Clément DEUST on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    public func sofiaProSemiBold() -> UIFont
    {
        let font = UIFont(name: "HelveticaNeue-Medium", size: 12)
        return font!
    }
    public func sofiaProRegular() -> UIFont
    {
        let font = UIFont(name: "HelveticaNeue", size: 12)
        return font!
    }
    public func sofiaProBold() -> UIFont
    {
        let font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        return font!
    }
}
