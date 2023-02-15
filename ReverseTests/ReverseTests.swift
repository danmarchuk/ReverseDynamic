//
//  ReverseTests.swift
//  ReverseTests
//
//  Created by Данік on 07/02/2023.
//

import XCTest


class ReverseTests: XCTestCase {
    

    func test_default_reverse_function_Foxminded_cool_247() {
        let reverse = ReverseBrain()
        let reverseFunc =  reverse.defaultReverseFunction("Foxminded cool 24/7")
        let expectedResult = "dednimxoF looc 24/7"
        XCTAssertTrue(reverseFunc == expectedResult)
        XCTAssertEqual(reverseFunc, expectedResult)
    }
    
    func test_default_reverse_function_abcd_efgh() {
        let reverse = ReverseBrain()
        let reverseFunc =  reverse.defaultReverseFunction("abcd efgh")
        let expectedResult = "dcba hgfe"
        XCTAssertTrue(reverseFunc == expectedResult)
        XCTAssertEqual(reverseFunc, expectedResult)
    }
    
    func test_default_reverse_function_with_numbers_and_characters() {
        let reverse = ReverseBrain()
        let reverseFunc =  reverse.defaultReverseFunction("a1bcd efg!h")
        let expectedResult = "d1cba hgf!e"
        XCTAssertTrue(reverseFunc == expectedResult)
        XCTAssertEqual(reverseFunc, expectedResult)
    }
    
    func test_custom_reverse_function_Foxminded_cool_247_exclusion_xl() {
        let reverse = ReverseBrain()
        let reverseFunc =  reverse.customReverseTheWords("Foxminded cool 24/7", exclusion: "xl")
        let expectedResult = "dexdnimoF oocl 7/42"
        XCTAssertTrue(reverseFunc == expectedResult)
        XCTAssertEqual(reverseFunc, expectedResult)
    }
    
    func test_custom_reverse_function_abcd_efgh_exclusion_xl() {
        let reverse = ReverseBrain()
        let reverseFunc =  reverse.customReverseTheWords("abcd efgh", exclusion: "xl")
        let expectedResult = "dcba hgfe"
        XCTAssertTrue(reverseFunc == expectedResult)
        XCTAssertEqual(reverseFunc, expectedResult)
    }
    
    
    func test_custom_reverse_function_with_numbers_and_characters_exclusion_xl() {
        let reverse = ReverseBrain()
        let reverseFunc =  reverse.customReverseTheWords("a1bcd efglh", exclusion: "xl")
        let expectedResult = "dcb1a hgfle"
        XCTAssertTrue(reverseFunc == expectedResult)
        XCTAssertEqual(reverseFunc, expectedResult)
    }
    
    
//    
//    
//    func test_reverseAnotherString() {
//        let reverse = ViewController()
//        let reverseFunc =  reverse.reverseFunction("Hello Obama")
//        let expectedResult = "olleH amabO"
//        XCTAssertTrue(reverseFunc == expectedResult)
//    }
    
}


