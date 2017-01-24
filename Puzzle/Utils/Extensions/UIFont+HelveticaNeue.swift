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
    public class func helveticaNeueMedium() -> UIFont
    {
        let font = UIFont(name: "HelveticaNeue-Medium", size: 12)
        return font!
    }
    
    public class func helveticaNeueRegular() -> UIFont
    {
        let font = UIFont(name: "HelveticaNeue", size: 12)
        return font!
    }
    
    public class func helveticaNeueBold() -> UIFont
    {
        let font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        return font!
    }
}
