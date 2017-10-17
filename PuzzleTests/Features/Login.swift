//
//  Login.swift
//  Evokid
//
//  Created by Clément DEUST on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import XCTest
import XCTest_Gherkin

@testable import Puzzle
class Login : XCTestCase {
 
    let register = AccountCreation()
    
    override func setUp() {
        super.setUp()
        ColorLog.enabled = true
    }
    
    func createUserDatabase() {
        Examples(
            [ "firstname", "lastname", "email", "password", "lock" ],
            [ "Aurelia", "DEUST", "test@integration.com", "testme", "8986" ]
        )
        
        Outline {
            Given("Creating a new account")
            When("I give its firstname <firstname>")
            And("I give its lastname <lastname>")
            And("I give its email <email>")
            And("I give its password <password>")
            And("I give its lock code <lock>")
            When("I save information")
            Then("I should be able to retrieve the user by its email <email> and its password <password>")
        }
    }
    
    func testLoginToAccount() {
        
        self.createUserDatabase()
        
        Examples(
            [ "email", "password" ],
            [ "test@integration.com", "testme" ]
        )
        
        Outline {
            Given("Logging in a new account")
            When("I give its email <email>")
            And("I give its password <password>")
            When("I sign in")
            Then("I should be able to retrieve the user by its email <email> and its password <password>")
        }
        
        self.cleanUserDatabase()
    }
    
    func cleanUserDatabase() {
        Examples(
            [ "firstname", "lastname", "email", "password", "lock" ],
            [ "Aurelia", "DEUST", "test@integration.com", "testme", "8986" ]
        )
        
        Outline {
            Given("Cleaning database")
            When("I delete user with email <email> and password <password>")
            Then("Database should erase this user")
        }
    }
}
