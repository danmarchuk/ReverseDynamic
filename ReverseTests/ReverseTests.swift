//
//  ReverseTests.swift
//  ReverseTests
//
//  Created by Данік on 07/02/2023.
//

import XCTest


class ReverseTests: XCTestCase {
    
    // for some reason the tests don't work propperly
    func test_reverseAString() {
        let reverse = ViewController()
        let reverseFunc =  reverse.reverseFunction(text: "Test string")
        let expectedResult = "tseT gnirts"
        print(reverseFunc)
        XCTAssertTrue(reverseFunc == expectedResult)
        XCTAssertEqual(reverseFunc, expectedResult)
    }
    
    
    func test_reverseAnotherString() {
        let reverse = ViewController()
        let reverseFunc =  reverse.reverseFunction(text: "Hello Obama")
        let expectedResult = "olleH amabO"
        XCTAssertTrue(reverseFunc == expectedResult)
    }
    
}


