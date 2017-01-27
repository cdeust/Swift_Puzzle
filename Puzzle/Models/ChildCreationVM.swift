//
//  ChildCreationVM.swift
//  Puzzle
//
//  Created by User on 27/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

protocol ChildCreationVCDelegate {
    func didSuccessfullyCreateAccount(user: Children)
    func didFailToCreateAccount()
}

class ChildCreationVM: NSObject {
    var birthdateText: String!
    var firstnameText: String!
    var lastnameText: String!
    var emailText: String!
    var sexText: String!
    var uidText: String!
    var errorText: String!
    var delegate: ChildCreationVCDelegate!
    
    func initWithFirstnameLastnameEmailSexBirthdateUidDelegate(firstname: String, lastname: String, email: String, sex: String, birthdate: String, uid: String, delegate: ChildCreationVCDelegate) -> AnyObject
    {
        self.firstnameText = firstname
        self.lastnameText = lastname
        self.emailText = email
        self.sexText = sex
        self.birthdateText = birthdate
        self.uidText = uid
        self.delegate = delegate
        
        return self
    }
    
    func createChild()
    {
        let coreDataStack = CoreDataStack.sharedStack
        let managedObjectContext = coreDataStack.persistentContainer.viewContext
        
        var results = Children.fetchChildrenWithFirstname(firstname: self.firstnameText, lastname: self.lastnameText, managedObjectContext: managedObjectContext)
        if results.count > 0
        {
            let managedObject = results[0] as! Children
            Children.updateChildrenWithUid(uid: self.uidText, email: self.emailText, firstname: self.firstnameText, lastname: self.lastnameText, sex: self.sexText, birthdate: self.birthdateText, role: "children", managedObjectContext: managedObjectContext, managedObject: managedObject)
        }
        else
        {
            Children.createChildrenWithUid(uid: self.uidText, email: self.emailText, firstname: self.firstnameText, lastname: self.lastnameText, sex: self.sexText, birthdate: self.birthdateText, role: "children", managedObjectContext: managedObjectContext)
        }
        
        results = Children.fetchChildrenWithUid(uid: self.uidText, managedObjectContext: managedObjectContext)
        
        if results.count > 0
        {
            self.errorText = NSLocalizedString("children_added", comment: "Your children was successfully added to your account !")
            
            let user = results[0] as! Children
            self.delegate.didSuccessfullyCreateAccount(user: user)
        }
        else
        {
            self.errorText = NSLocalizedString("children_failed_adding", comment: "Your children was not added due to error")
            self.delegate.didFailToCreateAccount()
        }
    }
}
