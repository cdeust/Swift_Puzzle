//
//  RegisterSteps.swift
//  Evokid
//
//  Created by Clément DEUST on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import XCTest
import XCTest_Gherkin

@testable import Puzzle

class RegisterSteps : StepDefiner {
    
    var firstname: String!
    var lastname: String!
    var email: String!
    var password: String!
    var lock: String!
    var sex: String!
    var birthdate: String!
    var user: User!
    var children: Children!
    
    override func defineSteps() {
        
        /* User step definition */
        
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
        
        /* Children step definition */
        
        step("Creating a new secondary user") {
            XCTAssertTrue(true)
        }
        
        step("I give its child firstname ([a-zA-Z0-9]*)") {
            (matches:[String]) in
            self.firstname = matches.first!
        }
        
        step("I give its child lastname ([a-zA-Z0-9]*)") {
            (matches:[String]) in
            self.lastname = matches.first!
        }
        
        step("I give its child sex ([a-zA-Z0-9]*)") {
            (matches:[String]) in
            self.sex = matches.first!
        }
        
        step("I give its child birthdate ([a-zA-Z0-9]*)") {
            (matches:[String]) in
            self.birthdate = matches.first!
        }
        
        step("I give its parent email ([A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6})") {
            (matches:[String]) in
            self.email = matches.first!
        }
        
        step("I save child information") {
            let coreDataStack = CoreDataStack()
            let managedObjectContext = coreDataStack.persistentContainer.viewContext
            Children.createChildrenWithUid(uid: "integration", email: self.email, firstname: self.firstname, lastname: self.lastname, sex: self.sex, birthdate: self.birthdate, role: "children", managedObjectContext: managedObjectContext)
        }
        
        step("I should be able to retrieve the child by its firstname ([a-zA-Z0-9]*) and its lastname ([a-zA-Z0-9]*)") {
            (matches:[String]) in
            
            let coreDataStack = CoreDataStack()
            let managedObjectContext = coreDataStack.persistentContainer.viewContext
            let array = Children.fetchChildrenWithFirstname(firstname: self.firstname, lastname: self.lastname, managedObjectContext: managedObjectContext)
            let user = array[0] as! Children
            self.children = user
            
            XCTAssertNotNil(self.children)
            XCTAssertEqual(self.children.firstname, self.firstname, "Firstname \(self.children.firstname) should be \(self.firstname)")
            XCTAssertEqual(self.children.lastname, self.lastname, "Lastname \(self.children.lastname) should be \(self.lastname)")
            XCTAssertEqual(self.children.sex, self.sex, "Sex \(self.children.sex) should be \(self.sex)")
            XCTAssertEqual(self.children.birthdate, self.birthdate, "Birthdate \(self.children.birthdate) should be \(self.birthdate)")
        }
        
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
        
        step("I delete child with firstname ([a-zA-Z0-9]*) and lastname ([a-zA-Z0-9]*)") {
            (matches:[String]) in
            self.firstname = matches.first!
            self.lastname = matches.last!
            
            let coreDataStack = CoreDataStack()
            let managedObjectContext = coreDataStack.persistentContainer.viewContext
            let results = Children.fetchChildrenWithFirstname(firstname: self.firstname, lastname:self.lastname, managedObjectContext:managedObjectContext)
            let user = results[0] as! User
            Children.deleteChildrenWithManagedObject(managedObject: user, managedObjectContext:managedObjectContext)
        }
        
        step("Database should erase this child") {
            let coreDataStack = CoreDataStack()
            let managedObjectContext = coreDataStack.persistentContainer.viewContext
            let results = Children.fetchChildrenWithFirstname(firstname: self.firstname, lastname: self.lastname, managedObjectContext: managedObjectContext)
            XCTAssertEqual(results.count, 0, "\(results.count) should be equal to 0")
        }
    }
}
