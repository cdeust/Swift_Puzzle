//
//  LoginSteps.swift
//  Evokid
//
//  Created by Clément DEUST on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import XCTest
import XCTest_Gherkin

// TODO : Fix the crash on the User retrieval to make the Login tests pass
// Most probably because RegisterSteps are executed before LoginSteps

@testable import Puzzle

class LoginSteps : StepDefiner {
    
    var firstname: String!
    var lastname: String!
    var email: String!
    var password: String!
    var lock: String!
    var user: User!
    
    override func defineSteps() {
        
        /* Login step definition */
        
        step("Logging in a new account") {
            XCTAssertTrue(true)
        }
        
        step("I give its email ([A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6})") {
            (matches:[String]) in
            self.email = matches.first!
        }
        
        step("I give its password ([a-zA-Z0-9]*)") {
            (matches:[String]) in
            self.password = matches.first!
        }
        
        step("I sign in") {
            XCTAssertTrue(true)
        }
        
        step("I should be able to retrieve the user by its email ([A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}) and its password ([a-zA-Z0-9]*)") {
            (matches:[String]) in
            
            let coreDataStack = CoreDataStack()
            let managedObjectContext = coreDataStack.persistentContainer.viewContext
            let array = User.fetchUserWithEmail(email: matches.first!, password: matches.last!, managedObjectContext: managedObjectContext)
            let user = array[0] as! User
            self.user = user
            self.user.firstname = user.firstname
            self.user.lastname = user.lastname
            self.user.lock = user.lock
            
            XCTAssertNotNil(self.user)
            XCTAssertEqual(self.user.firstname, self.firstname, "Firstname \(self.user.firstname) should be \(self.firstname)")
            XCTAssertEqual(self.user.lastname, self.lastname, "Lastname \(self.user.lastname) should be \(self.lastname)")
            XCTAssertEqual(self.user.email, self.email, "Email \(self.user.email) should be \(self.email)")
            XCTAssertGreaterThanOrEqual(self.user.password!.characters.count, 6)
            XCTAssertEqual(self.user.lock, self.lock, "Lock \(self.user.lock) should be \(self.lock)")
        }
    }
}
