//
//  MVVMBeginnerTests.swift
//  MVVMBeginnerTests
//
//  Created by Elexoft on 17/03/2025.
//

import XCTest
@testable import MVVMBeginner

final class MVVMBeginnerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        // Testing for the empty list
        let manager = TodoListManager.emptyState()
        
        XCTAssertTrue(manager.items.count == 0, "should start with empty list of todo's")
        
        // Adding the new item to the list and then testing
        manager.addItem()
        
        XCTAssertTrue(manager.items.count == 1, "should have one todo after adding")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
