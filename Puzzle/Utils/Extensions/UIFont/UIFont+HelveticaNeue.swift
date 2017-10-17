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
    
    public class func helveticaNeueRegular(size: CGFloat) -> UIFont
    {
        return UIFont(name: "HelveticaNeue", size: size)!
    }
    
    public class func helveticaNeueItalic(size: CGFloat) -> UIFont
    {
        return UIFont(name: "HelveticaNeue-Italic", size: size)!
    }
    
    public class func helveticaNeueBold(size: CGFloat) -> UIFont
    {
        return UIFont(name: "HelveticaNeue-Bold", size: size)!
    }
    
    public class func helveticaNeueMedium(size: CGFloat) -> UIFont
    {
        return UIFont(name: "HelveticaNeue-Medium", size: size)!
    }
    
    public class func helveticaNeueLight(size: CGFloat) -> UIFont
    {
        return UIFont(name: "HelveticaNeue-Light", size: size)!
    }
    
    public class func helveticaNeueThin(size: CGFloat) -> UIFont
    {
        return UIFont(name: "HelveticaNeue-Thin", size: size)!
    }
    
    public class func helveticaNeueUltraLight(size: CGFloat) -> UIFont
    {
        return UIFont(name: "HelveticaNeue-UltraLight", size: size)!
    }
}
