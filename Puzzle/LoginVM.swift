//
//  LoginVM.swift
//  Puzzle
//
//  Created by User on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import Foundation
import UIKit

protocol LoginVCDelegate
{
    func didSuccessfullyLogin(user: User) -> Void
    func didFailedToLogin() -> Void
}

class LoginVM: NSObject {
    var loginText: String!
    var passwordText: String!
    var errorText: String!
    var signinText: String!
    var createText: String!
    var delegate: LoginVCDelegate!
    
    func initWithDelegate(delegate:LoginVCDelegate) -> AnyObject
    {
        self.delegate = delegate
        
        return self
    }
    
    func initWithEmailPasswordDelegate(email: String, password: String, delegate: LoginVCDelegate) -> AnyObject
    {
        self.loginText = email;
        self.passwordText = password;
        self.delegate = delegate;
        
        return self;
    }
    
    func login() -> Void
    {
        if let delegate = UIApplication.shared.delegate as? AppDelegate
        {
            let managedObjectContext = delegate.persistentContainer.viewContext
            let result: NSArray = User.fetchUserWithEmail(email: self.loginText, password: self.passwordText, managedObjectContext: managedObjectContext)
            
            if (result.count > 0)
            {
                self.errorText = NSLocalizedString("logged_in", comment:"You're connected !");
                
                let user: User = result[0] as! User;
                self.delegate.didSuccessfullyLogin(user: user);
            }
            else
            {
                self.errorText = NSLocalizedString("failed_to_login", comment:"Email or password mismatched");
                
                self.delegate.didFailedToLogin();
            }
        }
    }
}
