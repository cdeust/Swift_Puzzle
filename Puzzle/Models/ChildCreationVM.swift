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
    private var _birthdateText: String!
    private var _firstnameText: String!
    private var _lastnameText: String!
    private var _emailText: String!
    private var _sexText: String!
    private var _uidText: String!
    private var _errorText: String!
    private var _delegate: ChildCreationVCDelegate!
    
    var birthdateText: String {
        get {
            return _birthdateText
        }
        set {
            _birthdateText = newValue
        }
    }
    
    var firstnameText: String {
        get {
            return _firstnameText
        }
        set {
            _firstnameText = newValue
        }
    }
    
    var lastnameText: String {
        get {
            return _lastnameText
        }
        set {
            _lastnameText = newValue
        }
    }
    
    var emailText: String {
        get {
            return _emailText
        }
        set {
            _emailText = newValue
        }
    }
    
    var sexText: String {
        get {
            return _sexText
        }
        set {
            _sexText = newValue
        }
    }
    
    var uidText: String {
        get {
            return _uidText
        }
        set {
            _uidText = newValue
        }
    }
    
    var errorText: String {
        get {
            return _errorText
        }
        set {
            _errorText = newValue
        }
    }
    
    var delegate: ChildCreationVCDelegate {
        get {
            return _delegate
        }
        set {
            _delegate = newValue
        }
    }
    
    func initWithFirstnameLastnameEmailSexBirthdateUidDelegate(firstname: String, lastname: String, email: String, sex: String, birthdate: String, uid: String, delegate: ChildCreationVCDelegate) -> AnyObject
    {
        self._firstnameText = firstname
        self._lastnameText = lastname
        self._emailText = email
        self._sexText = sex
        self._birthdateText = birthdate
        self._uidText = uid
        self._delegate = delegate
        
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
