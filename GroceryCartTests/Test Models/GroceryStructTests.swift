//
//  GroceryStructTests.swift
//  GroceryCartTests
//
//  Created by ESSA AL on 8/21/20.
//  Copyright © 2020 ESSA ALDOWAIHES. All rights reserved.
//

import XCTest
@testable import GroceryCart

class GroceryStructTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testInit_GroceryWithItemName() {
        let testGrocery = Grocery(itemName: "Almond Milk")
        
        XCTAssertNotNil(testGrocery)
        XCTAssertEqual(testGrocery.itemName, "Almond Milk")
    }

    func testInit_SetGroceryItemNameAndBrandName() {
        let testGrocery = Grocery(itemName: "Eggs", brandName: "EggBrand")
        XCTAssertNotNil(testGrocery)
        XCTAssertEqual(testGrocery.brandName, "EggBrand")
    }
}
