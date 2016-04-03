//
//  ReignDesignDemoTests.swift
//  ReignDesignDemoTests
//
//  Created by Ben Smith on 28/09/2015.
//  Copyright (c) 2015 Ben Smith. All rights reserved.
//

import UIKit
import XCTest
@testable import ReignDesignDemo

class ReignDesignDemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testUserRequestReturnsData() {
        let expectation = expectationWithDescription("Waiting to respond")
        
        HackerNewsDataController.sharedInstance.loadFeed() { (flag) in
            XCTAssert(HackerNewsDataController.sharedInstance.newHackerData != nil)
            
            let result = HackerNewsDataController.sharedInstance.newHackerData!
            XCTAssertTrue(flag)
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(5.0, handler:nil)
    }
}
