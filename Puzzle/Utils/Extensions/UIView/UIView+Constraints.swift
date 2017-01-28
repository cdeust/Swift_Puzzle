//
//  UIView+Constraints.swift
//  Puzzle
//
//  Created by User on 25/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public func setupConstraintsUsingVisualFormatForUIElementWithParentView(element: Any, parentView: UIView, visualFormat: String)
    {
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: visualFormat, options: .directionLeadingToTrailing, metrics: nil, views: [ "element" : element ]))
    }
}
