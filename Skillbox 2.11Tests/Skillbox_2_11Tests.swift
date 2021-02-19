//
//  Skillbox_2_11Tests.swift
//  Skillbox 2.11Tests
//
//  Created by Артём on 2/17/21.
//

import XCTest
@testable import Skillbox_2_11

class Skillbox_2_11Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        XCTAssert("artem@d.tr".isValid(.email))
        XCTAssert("a-tem@dv.tr".isValid(.email))
        XCTAssert(!"artem@@dv.ccccccc".isValid(.email))
        XCTAssert(!"artem@.dv.tr".isValid(.email))
        
        XCTAssert("Artem4".isValid(.password))
        XCTAssert("artEm4e".isValid(.password))
        XCTAssert(!"!dghgv4".isValid(.password))
        XCTAssert(!"jjA4r".isValid(.password))
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
