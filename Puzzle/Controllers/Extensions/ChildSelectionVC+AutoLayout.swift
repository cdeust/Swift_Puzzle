//
//  ChildSelectionVC+AutoLayout.swift
//  Puzzle
//
//  Created by User on 25/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

extension ChildSelectionVC {
    func setConstraintsForUIElementWithParentView(element: Any, parentView: UIView, verticalValue: Int)
    {
        parentView.setupConstraintsUsingVisualFormatForUIElementWithParentView(element: element, parentView: parentView, visualFormat: String().getDynamicVerticalVisualFormat(verticalValue: verticalValue))
        parentView.setupConstraintsUsingVisualFormatForUIElementWithParentView(element: element, parentView: parentView, visualFormat: String().getHorizontalVisualFormatCenter())
    }
    
    func setConstraintsForUIElementWithParentView(element: Any, parentView: UIView, verticalAlign: String)
    {
        switch verticalAlign
        {
        case "top":
            parentView.setupConstraintsUsingVisualFormatForUIElementWithParentView(element: element, parentView: parentView, visualFormat: String().getVerticalVisualFormatTop())
            parentView.setupConstraintsUsingVisualFormatForUIElementWithParentView(element: element, parentView: parentView, visualFormat: String().getHorizontalVisualFormatCenter())
            break
        case "bottom":
            parentView.setupConstraintsUsingVisualFormatForUIElementWithParentView(element: element, parentView: parentView, visualFormat: String().getVerticalVisualFormatBottom())
            parentView.setupConstraintsUsingVisualFormatForUIElementWithParentView(element: element, parentView: parentView, visualFormat: String().getHorizontalVisualFormatCenter())
            break
        default:
            break
        }
    }
}
