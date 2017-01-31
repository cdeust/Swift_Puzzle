//
//  ChildCreationUITests.swift
//  Puzzle
//
//  Created by User on 27/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import XCTest

class ChildCreationUITests: XCTestCase {
        
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app.launch()
        print(app.debugDescription)
    }
    
    func testChildCreationUIElementsExists() {
        let email = app.textFields.element(matching: .textField, identifier: "email")
        email.tap()
        email.typeText("test@integration.com")
        email.typeText("\n")
        
        let password = app.secureTextFields.element(matching: .secureTextField, identifier: "password")
        password.tap()
        password.typeText("testme")
        password.typeText("\n")
        
        app.buttons["Login"].tap()
        app.buttons["Add children"].tap()
        
        XCTAssert(app.staticTexts["Birthdate"].exists)
        XCTAssert(app.staticTexts["Firstname"].exists)
        XCTAssert(app.staticTexts["Lastname"].exists)
        XCTAssert(app.staticTexts["Sex"].exists)
        XCTAssert(app.buttons["Add"].exists)
        XCTAssert(app.buttons["End"].exists)
    }
    
    func testChildCreationPopupErrorMessage() {
        let email = app.textFields.element(matching: .textField, identifier: "email")
        email.tap()
        email.typeText("test@integration.com")
        email.typeText("\n")
        
        let password = app.secureTextFields.element(matching: .secureTextField, identifier: "password")
        password.tap()
        password.typeText("test@integration.com")
        password.typeText("\n")
        
        app.buttons["Login"].tap()
        app.buttons["Add children"].tap()
        app.buttons["Add"].tap()
        
        XCTAssertEqual(app.alerts.element.label, "Invalid values sent")
        app.alerts["Invalid values sent"].buttons["OK"].tap()
    }
    
    func testChildCreationAddButton() {
        let email = app.textFields.element(matching: .textField, identifier: "email")
        email.tap()
        email.typeText("test@integration.com")
        email.typeText("\n")
        
        let password = app.secureTextFields.element(matching: .secureTextField, identifier: "password")
        password.tap()
        password.typeText("testme")
        password.typeText("\n")
        
        app.buttons["Login"].tap()
        app.buttons["Add children"].tap()
        
        let firstname = app.textFields.element(matching: .textField, identifier: "firstname")
        firstname.tap()
        firstname.typeText("chloe")
        firstname.typeText("\n")
        
        let birthdate = app.textFields.element(matching: .textField, identifier: "birthdate")
        birthdate.tap()
        birthdate.typeText("03/04/2016")
        birthdate.typeText("\n")
        
        let sex = app.textFields.element(matching: .textField, identifier: "sex")
        sex.tap()
        sex.typeText("female")
        sex.typeText("\n")
        
        let errorMessage = self.app.staticTexts["Your child was successfully added to your account !"]
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: errorMessage, handler: nil)
        
        app.buttons["Add"].tap()
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssert(errorMessage.exists)
    }
    
    func testChildCreationEndButton() {
        let email = app.textFields.element(matching: .textField, identifier: "email")
        email.tap()
        email.typeText("test@integration.com")
        email.typeText("\n")
        
        let password = app.secureTextFields.element(matching: .secureTextField, identifier: "password")
        password.tap()
        password.typeText("testme")
        password.typeText("\n")
        
        app.buttons["Login"].tap()
        app.buttons["Add children"].tap()
        app.buttons["End"].tap()
        
        XCTAssert(app.staticTexts["Welcome test!"].exists)
        XCTAssert(app.buttons["Add children"].exists)
        XCTAssert(app.buttons["Log out"].exists)
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
