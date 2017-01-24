//
//  Register.swift
//  Evokid
//
//  Created by Clément DEUST on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import XCTest
import XCTest_Gherkin

class Register : XCTestCase {
    
    override func setUp() {
        super.setUp()
        ColorLog.enabled = true
    }
    
    func testCreatingAccount()
    {
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
        
        self.cleanUserDatabase()
    }
    
    func testCreatingChildren()
    {
        Examples(
            [ "firstname", "lastname", "email", "sex", "birthdate" ],
            [ "chloe", "DEUST", "test@integration.com", "Female", "03042016" ]
        )
        
        Outline {
            Given("Creating a new secondary user")
            When("I give its child firstname <firstname>")
            And("I give its child lastname <lastname>")
            And("I give its child sex <sex>")
            And("I give its parent email <email>")
            And("I give its child birthdate <birthdate>")
            When("I save child information")
            Then("I should be able to retrieve the child by its firstname <firstname> and its lastname <lastname>")
        }
        
        self.cleanChildrenDatabase()
    }
    
    func cleanUserDatabase()
    {
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
    
    func cleanChildrenDatabase()
    {
        Examples(
            [ "firstname", "lastname", "sex", "birthdate" ],
            [ "chloe", "DEUST", "Female", "03042016" ]
        )
        
        Outline {
            Given("Cleaning database")
            When("I delete child with firstname <firstname> and lastname <lastname>")
            Then("Database should erase this child")
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
