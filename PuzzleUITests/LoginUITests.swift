//
//  LoginUITests.swift
//  Puzzle
//
//  Created by User on 25/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import XCTest

class LoginUITests: XCTestCase {
        
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app.launch()
        print(app.debugDescription)
    }
    
    func testLoginViewUIElementsExists() {
        XCTAssert(app.staticTexts["Email"].exists)
        XCTAssert(app.staticTexts["Password"].exists)
        XCTAssert(app.buttons["Create"].exists)
        XCTAssert(app.buttons["Login"].exists)
    }
    
    func testLoginErrorPopup() {
        app.buttons["Login"].tap()
        XCTAssertEqual(app.alerts.element.label, "Invalid values sent")
        app.alerts["Invalid values sent"].buttons["OK"].tap()
    }
    
    func testLoginFailMessage() {
        let email = app.textFields.element(matching: .textField, identifier: "email")
        email.tap()
        email.typeText("test@test.com")
        email.typeText("\n")
        
        let password = app.secureTextFields.element(matching: .secureTextField, identifier: "password")
        password.tap()
        password.typeText("testme")
        password.typeText("\n")
        
        let errorMessage = self.app.staticTexts["Email or password mismatched."]
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: errorMessage, handler: nil)
        
        app.buttons["Login"].tap()
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssert(errorMessage.exists)
    }
    
    func testLoginSuccessMessage() {
        let email = app.textFields.element(matching: .textField, identifier: "email")
        email.tap()
        email.typeText("test@integration.com")
        email.typeText("\n")
        
        let password = app.secureTextFields.element(matching: .secureTextField, identifier: "password")
        password.tap()
        password.typeText("testme")
        password.typeText("\n")
        
        let errorMessage = self.app.staticTexts["You're connected !"]
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: errorMessage, handler: nil)
        
        app.buttons["Login"].tap()
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssert(errorMessage.exists)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}
