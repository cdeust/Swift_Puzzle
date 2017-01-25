//
//  ChildSelectionVM.swift
//  Puzzle
//
//  Created by User on 25/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

class ChildSelectionVM: NSObject {
    var welcomeText: String!
    var user: User!
    
    func initWithUser(user: User) -> AnyObject
    {
        self.user = user
        if let firstname = self.user.firstname
        {
            self.welcomeText = "Welcome \(firstname)!"
        }
        
        return self
    }
    
    func getChildrenForPresentAccount() -> NSArray
    {
        let coreDataStack = CoreDataStack()
        let managedObjectContext = coreDataStack.persistentContainer.viewContext
        
        if let uid = self.user.uid {
            let results = Children.fetchChildrenWithUid(uid: uid, managedObjectContext: managedObjectContext)
            let children = NSMutableArray()
            if results.count > 0
            {
                for object in results
                {
                    children.add(object as! Children)
                }
            }
            return children
        }
        return NSMutableArray()
    }
}

// MARK: Auto Layout initialization

extension ChildSelectionVM {
    func setConstraintsForUIElementWithParentView(element: Any, parentView: UIView, verticalValue: Int)
    {
        parentView.setupConstraintsUsingVisualFormatForUIElementWithParentView(element: element, parentView: parentView, visualFormat: self.getDynamicVerticalVisualFormat(verticalValue: verticalValue))
        parentView.setupConstraintsUsingVisualFormatForUIElementWithParentView(element: element, parentView: parentView, visualFormat: self.getHorizontalVisualFormatCenter())
    }
    
    func setConstraintsForUIElementWithParentView(element: Any, parentView: UIView, verticalAlign: String)
    {
        switch verticalAlign
        {
            case "top":
                parentView.setupConstraintsUsingVisualFormatForUIElementWithParentView(element: element, parentView: parentView, visualFormat: self.getVerticalVisualFormatTop())
                parentView.setupConstraintsUsingVisualFormatForUIElementWithParentView(element: element, parentView: parentView, visualFormat: self.getHorizontalVisualFormatCenter())
                break
            case "bottom":
                parentView.setupConstraintsUsingVisualFormatForUIElementWithParentView(element: element, parentView: parentView, visualFormat: self.getVerticalVisualFormatBottom())
                parentView.setupConstraintsUsingVisualFormatForUIElementWithParentView(element: element, parentView: parentView, visualFormat: self.getHorizontalVisualFormatCenter())
                break
            default:
                break
        }
    }
    
    func getDynamicVerticalVisualFormat(verticalValue: Int) -> String
    {
        return String(format: "V:|-(%i)-[element(30)]", verticalValue)
    }
    
    func getVerticalVisualFormatBottom() -> String
    {
        return String(format: "V:[element(30)]-(25)-|")
    }
    
    func getVerticalVisualFormatTop() -> String
    {
        return String(format: "V:|-(80)-[element(30)]")
    }
    
    func getHorizontalVisualFormatCenter() -> String
    {
        return String(format: "H:|-(25)-[element]-(25)-|")
    }
}
