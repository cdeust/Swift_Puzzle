//
//  Login.swift
//  Evokid
//
//  Created by Clément DEUST on 23/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import XCTest
import XCTest_Gherkin

class Login : XCTestCase {
 
    override func setUp() {
        super.setUp()
        ColorLog.enabled = true
    }
    
    func testLoginToAccount() {
        Examples(
            [ "email", "password" ],
            [ "aurelia.saint-lo@orange.fr", "testme" ]
        )
        
        Outline {
            Given("Logging in a new account")
            When("I give its email <email>")
            And("I give its password <password>")
            When("I sign in")
            Then("I should be able to retrieve the user by its email <email> and its password <password>")
        }
    }
}
