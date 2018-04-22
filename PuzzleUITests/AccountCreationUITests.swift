//
//  AccountCreationUITests.swift
//  Puzzle
//
//  Created by User on 25/01/2017.
//  Copyright © 2017 cdeust. All rights reserved.
//

import XCTest
import SmileLock

class AccountCreationUITests: XCTestCase {
        
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app.launch()
        print(app.debugDescription)
    }
    
    func testRegisterErrorPopup() {
        app.buttons["Create"].tap()
        app.buttons["Create"].tap()
        XCTAssertEqual(app.alerts.element.label, "Invalid values sent")
        app.alerts["Invalid values sent"].buttons["OK"].tap()
    }
    
    func testRegisterViewUIElementsExists() {
        app.buttons["Create"].tap()
        XCTAssert(app.staticTexts["Firstname"].exists)
        XCTAssert(app.staticTexts["Lastname"].exists)
        XCTAssert(app.staticTexts["Email"].exists)
        XCTAssert(app.staticTexts["Password"].exists)
        XCTAssert(app.staticTexts["Lock"].exists)
        XCTAssert(app.buttons["Create"].exists)
        XCTAssert(app.buttons["Login"].exists)
    }
    
    func testCreateSuccessMessage() {
        app.buttons["Create"].tap()
        
        let firstname = app.textFields.element(matching: .textField, identifier: "firstname")
        firstname.tap()
        firstname.typeText("test")
        firstname.typeText("\n")
        
        let lastname = app.textFields.element(matching: .textField, identifier: "lastname")
        lastname.tap()
        lastname.typeText("test")
        lastname.typeText("\n")
        
        let email = app.textFields.element(matching: .textField, identifier: "email")
        email.tap()
        email.typeText("test@integration.com")
        email.typeText("\n")
        
        let password = app.secureTextFields.element(matching: .secureTextField, identifier: "password")
        password.tap()
        password.typeText("testme")
        password.typeText("\n")
        
        let lock = app.buttons.element(matching: .button, identifier: "lockCode")
        lock.tap()
        
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["4"].tap()
        
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["4"].tap()
        
        app.buttons["Create"].tap()
        
        XCTAssert(app.staticTexts["Birthdate"].exists)
        XCTAssert(app.staticTexts["Firstname"].exists)
        XCTAssert(app.staticTexts["Lastname"].exists)
        XCTAssert(app.staticTexts["Sex"].exists)
        XCTAssert(app.buttons["Add"].exists)
        XCTAssert(app.buttons["End"].exists)
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
