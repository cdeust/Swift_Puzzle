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
    private var _welcomeText: String!
    private var _userObject: UserObject!
    
    var welcomeText: String {
        get {
            return _welcomeText
        }
        set {
            _welcomeText = newValue
        }
    }
    
    var userObject: UserObject {
        get {
            return _userObject
        }
        set {
            _userObject = newValue
        }
    }
    
    
    init(userObject: UserObject)
    {
        self._userObject = userObject
        if let firstname = userObject.firstname
        {
            self._welcomeText = "Welcome \(firstname)!"
        }
    }
    
    func getChildrenForPresentAccount() -> NSArray
    {
        let coreDataStack = CoreDataStack.sharedStack
        let managedObjectContext = coreDataStack.persistentContainer.viewContext
        
        if let uid = self.userObject.uid {
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
