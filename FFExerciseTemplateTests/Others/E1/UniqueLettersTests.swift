//
//  UniqueLettersTests.swift
//  UniqueLettersTests
//
//  Created by João David on 15/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import XCTest
@testable import FFExerciseTemplate

class UniqueLettersTests: XCTestCase {

    func testUniqueLetters() {
        
        XCTAssertTrue(UniqueLetters.areLettersUnique(input: "No duplicates"))
        XCTAssertTrue(UniqueLetters.areLettersUnique(input: "abcdefghijklmnopqrstuvwxyz"))
        XCTAssertTrue(UniqueLetters.areLettersUnique(input: "AaBbCc"))
        XCTAssertFalse(UniqueLetters.areLettersUnique(input: "farfetch"))
    }
}
