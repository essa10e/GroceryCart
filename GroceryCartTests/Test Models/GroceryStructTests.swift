//
//  GroceryStructTests.swift
//  GroceryCartTests
//
//  Created by ESSA AL.
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

    // MARK:- Initialization Tests
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
    
    // MARK:- Equatable Tests
    func testEquatable_ReturnsTrue() {
        let groceryItemPizza1 = Grocery(itemName: "Pizza")
        let groceryItemPizza2 = Grocery(itemName: "Pizza")
        
        XCTAssertEqual(groceryItemPizza1, groceryItemPizza2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentItems() {
        let groceryItem1 = Grocery(itemName: "Pizza")
        let groceryItem2 = Grocery(itemName: "Kiwi")
        
        XCTAssertNotEqual(groceryItem1, groceryItem2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentBrandName() {
        let groceryItem1 = Grocery(itemName: "Pizza", brandName: "PizzaHut")
        let groceryItem2 = Grocery(itemName: "Pizza", brandName: "PizzaWhat")
        
        XCTAssertNotEqual(groceryItem1, groceryItem2)
    }
}
