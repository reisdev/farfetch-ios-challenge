//
//  IntegerDisguisedTests.swift
//  FFExerciseTemplateTests
//
//  Created by João David on 18/04/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import XCTest
@testable import FFExerciseTemplate

class IntegerDisguisedTests: XCTestCase {
    
    func testIntegerDisguised() {

        XCTAssertTrue(IntegerDisguised.reveal(input: "01010101"))
        XCTAssertTrue(IntegerDisguised.reveal(input: "123456789"))
        XCTAssertTrue(IntegerDisguised.reveal(input: "9223372036854775808"))
        XCTAssertFalse(IntegerDisguised.reveal(input: "1.01"))
        XCTAssertFalse(IntegerDisguised.reveal(input: "123ssd233"))
    }
}
