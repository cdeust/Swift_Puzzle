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
        
        /* User creation step definition */
        
        step("Creating a new account") {
            XCTAssertTrue(true)
        }
        
        step("I give its firstname ([a-zA-Z0-9]*)") {
            (matches:[String]) in
            self.firstname = matches.first!
        }
        
        step("I give its lastname ([a-zA-Z0-9]*)") {
            (matches:[String]) in
            self.lastname = matches.first!
        }
        
        step("I give its email ([A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6})") {
            (matches:[String]) in
            self.email = matches.first!
        }
        
        step("I give its password ([a-zA-Z0-9]*)") {
            (matches:[String]) in
            self.password = matches.first!
        }
        
        step("I give its lock code ([a-zA-Z0-9]*)") {
            (matches:[String]) in
            self.lock = matches.first!
        }
        
        step("I save information") {
            let coreDataStack = CoreDataStack()
            let managedObjectContext = coreDataStack.persistentContainer.viewContext
            
            let email: String = self.email
            let firstname: String = self.firstname
            let lastname: String = self.lastname
            let lock: String = self.lock
            let password: String = self.password
            
            User.createUserWithUid(uid: "integration", email:email, firstname:firstname, lastname:lastname, lock:lock, password:password, role:"master", managedObjectContext:managedObjectContext)
        }
        
        step("I should be able to retrieve the user by its email ([A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}) and its password ([a-zA-Z0-9]*)") {
            (matches:[String]) in
            
            let coreDataStack = CoreDataStack()
            let managedObjectContext = coreDataStack.persistentContainer.viewContext
            let array = User.fetchUserWithEmail(email: matches.first!, password: matches.last!, managedObjectContext: managedObjectContext)
            let user = array[0] as! User
            self.user = user
            
            XCTAssertNotNil(self.user)
            XCTAssertEqual(self.user.firstname, self.firstname, "Firstname \(self.user.firstname) should be \(self.firstname)")
            XCTAssertEqual(self.user.lastname, self.lastname, "Lastname \(self.user.lastname) should be \(self.lastname)")
            XCTAssertEqual(self.user.email, self.email, "Email \(self.user.email) should be \(self.email)")
            XCTAssertGreaterThanOrEqual(self.user.password!.characters.count, 6)
            XCTAssertEqual(self.user.lock, self.lock, "Lock code \(self.user.lock) should be \(self.lock)")
        }
        
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
        
        /* Cleaning user database */
        
        step("Cleaning database") {
            XCTAssertTrue(true)
        }
        
        step("I delete user with email ([A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}) and password ([a-zA-Z0-9]*)") {
            (matches:[String]) in
            self.email = matches.first!
            self.password = matches.last!
            
            let coreDataStack = CoreDataStack()
            let managedObjectContext = coreDataStack.persistentContainer.viewContext
            let results = User.fetchUserWithEmail(email: self.email, password:self.password, managedObjectContext:managedObjectContext)
            let user = results[0] as! User
            User.deleteUserWithManagedObject(managedObject: user, managedObjectContext: managedObjectContext)
        }
        
        step("Database should erase this user") {
            let coreDataStack = CoreDataStack()
            let managedObjectContext = coreDataStack.persistentContainer.viewContext
            let results = User.fetchUserWithEmail(email: self.email, password:self.password, managedObjectContext:managedObjectContext)
            XCTAssertEqual(results.count, 0, "\(results.count) should be equal to 0")
        }
    }
}
