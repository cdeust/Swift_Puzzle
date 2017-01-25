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
        if let firstname = self.user.firstname {
            self.welcomeText = "Welcome \(firstname)!"
        }
        
        return self
    }
    
    func getChildrenForPresentAccount() -> NSArray
    {
        let coreDataStack = CoreDataStack()
        let managedObjectContext = coreDataStack.persistentContainer.viewContext
        
        let results = Children.fetchChildrenWithUid(uid: self.user.uid!, managedObjectContext: managedObjectContext)
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
    
    func setupConstraintsForButtonWithParentViewVerticalValue(button: UIButton, parentView: UIView, verticalValue: Int)
    {
        let string = String(format: "V:|-(%i)-[button(30)]", verticalValue)
        
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: string, options: .directionLeadingToTrailing, metrics: nil, views: [ "button" : button ]))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(25)-[button]-(25)-|", options: .directionLeadingToTrailing, metrics: nil, views: [ "button" : button ]))
    }
    
    func setupConstraintsForLogoutButtonWithParentViewVerticalValue(button: UIButton, parentView: UIView, verticalValue: Int)
    {
        let string = String(format: "V:[button(30)]-(%i)-|", verticalValue)
        
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: string, options: .directionLeadingToTrailing, metrics: nil, views: [ "button" : button ]))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(25)-[button]-(25)-|", options: .directionLeadingToTrailing, metrics: nil, views: [ "button" : button ]))
    }
}
