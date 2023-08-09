//
//  ImageStoreTests.swift
//  ImageStoreTests
//
//  Created by João David on 15/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import XCTest
@testable import FFExerciseTemplate

/**
 *   UT_E1
 *
 *   The objective is to Unit Test ImageStore's cache mechanism.
 *   We have two URLs to help you do it.
 *
 *   1 - Image url: "https://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg"
 *   2 - Image url: "https://i.annihil.us/u/prod/marvel/i/mg/b/70/4c0035adc7d3a.jpg"
 *
 *   Requirements:
 *     We want to test the ImageStore API.
 *     We want to validate that a downloaded image for the first time is not cached.
 *     Subsequent downloads of the same image must be cached.
 *     ImageStore cache should be clean at the end.
 */

class ImageStoreTests: XCTestCase {
    
    private let imageStore = ImageStore()

    override func setUp() {
        super.setUp()
    }
    
    func test_fetch_cacheShouldWork() throws {
        let url = try XCTUnwrap(URL(string: "https://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg"), "URL should be valid")
        
        let expectation = expectation(description: "Image is not cached")
        
        imageStore.fetch(for: url) { (_, isCached) in
            guard !isCached else { return }
            
            self.imageStore.fetch(for: url) { (image, isCached) in
                guard isCached else { return }
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    override func tearDown() {

        super.tearDown()
    }
}
