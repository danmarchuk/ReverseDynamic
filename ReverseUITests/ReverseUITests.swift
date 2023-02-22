//
//  ReverseUITests.swift
//  ReverseUITests
//
//  Created by Данік on 07/02/2023.
//

import XCTest


final class ReverseUITests: XCTestCase {
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false
        
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // reverse textfield tap and type
        let reverseTextField = app.textFields["Type Here"]
        XCTAssertTrue(reverseTextField.exists)
        reverseTextField.tap()
        reverseTextField.typeText("Foxminded cool 24/7")
        reverseTextField.typeText("\n")
        
        
        // check if the text reversed
        let reversedLabel = app.staticTexts.element(matching: .any, identifier: "ReversedTextLabel")
        XCTAssertTrue(reversedLabel.label.contains("dednimxoF looc 24/7"))
        
        
        let customButton = app/*@START_MENU_TOKEN@*/.segmentedControls.buttons["Custom"]/*[[".segmentedControls.buttons[\"Custom\"]",".buttons[\"Custom\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        customButton.tap()
        XCTAssertTrue(reversedLabel.label.contains("dednimxoF looc 7/42"))
        
        
        let excludionTextfield = app.textFields.element(matching: .any, identifier: "ExclusionTextField")
        XCTAssertTrue(excludionTextfield.exists)
        excludionTextfield.tap()
        excludionTextfield.typeText("xl")
        excludionTextfield.typeText("\n")

        XCTAssertTrue(reversedLabel.label.contains("dexdnimoF oocl 7/42"))
           
    }
    
}
