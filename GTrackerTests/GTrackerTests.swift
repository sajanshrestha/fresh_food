//
//  GTrackerTests.swift
//  GTrackerTests
//
//  Created by Sajan Shrestha on 2/18/20.
//  Copyright © 2020 Sajan Shrestha. All rights reserved.
//

import XCTest
@testable import GTracker

class GTrackerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBestByDate() {
        var item = Item(name: "Banana", quantity: 2, purchaseDate: Date(), category: .fruit)
        item.bestByDate = 1
        XCTAssertEqual(item.isPastBestByDate, false)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
