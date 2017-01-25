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
