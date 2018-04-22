//
//  UILabel+Design.swift
//  Puzzle
//
//  Created by Clément DEUST on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    public class func designLabel(label: UILabel) -> UILabel {
        label.font = UIFont.helveticaNeueRegular()
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.darkGray
        
        return label
    }
    
    public class func designErrorLabel(label: UILabel) -> UILabel {
        label.font = UIFont.helveticaNeueRegular()
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.red
        
        return label
    }
}
