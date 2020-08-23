//
//  GroceryManagerTest.swift
//  GroceryCartTests
//
//  Created by ESSA AL.
//  Note: sut = system under test.

import XCTest
@testable import GroceryCart

class GroceryManagerTest: XCTestCase {

    var sut: GroceryManager!
    
    let cookies = Grocery(itemName: "Cookie")
    let toothPaste = Grocery(itemName: "Tooth Paste")
    let chickenPizza = Grocery(itemName: "Chicken Pizza")
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = GroceryManager()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK:- Initial Values
    func testInit_GroceryToBuy_ReturnsZero() {
        XCTAssertEqual(sut.groceryToBuyCount, 0)
    }

    func testInit_GroceryFound_ReturnsZero() {
        XCTAssertEqual(sut.groceryFoundCount, 0)
    }

    // MARK:- Add & Query:
    func testAdd_GroceryToABuy_ReturnsZero() {
        sut.addGrocery(grocery: cookies)
        XCTAssertEqual(sut.groceryToBuyCount, 1)
    }
    
    func testQuery_ReturnsGroceryAtIndex() {
        sut.addGrocery(grocery: toothPaste)
        
        let groceryQueried = sut.groceryAtIndex(index: 0)
        XCTAssertEqual(toothPaste.itemName, groceryQueried.itemName)
    }
    
    // MARK:- Checking off
    func testCheckingOffGrocery_UpdateGroceryManagerCount() {
        sut.addGrocery(grocery: chickenPizza)
        sut.checkOffGroceryAtIndex(index: 0)
        
        XCTAssertEqual(sut.groceryToBuyCount, 0)
        XCTAssertEqual(sut.groceryFoundCount, 1)
    }
    
    func testCheckOffGrocery_RemovesGroceryFromArray() {
        sut.addGrocery(grocery: cookies)
        sut.addGrocery(grocery: toothPaste)
        sut.checkOffGroceryAtIndex(index: 0)
        
        XCTAssertEqual(sut.groceryAtIndex(index: 0).itemName, toothPaste.itemName)
    }
    
    func testCheckOffGrocery_ReturnsGroceryAtIndex() {
        sut.addGrocery(grocery: cookies)
        sut.checkOffGroceryAtIndex(index: 0)
        
        let groceryQueried = sut.checkedOffGroceryAtIndex(index: 0)
        XCTAssertEqual(cookies.itemName, groceryQueried.itemName)
    }
    
    // MARK:- Clearing Arrays and Resetting
    func testClearArrays_ReturnsArrayCountsOfZeros() {
        sut.addGrocery(grocery: cookies)
        sut.addGrocery(grocery: toothPaste)
        sut.checkOffGroceryAtIndex(index: 0)

        XCTAssertEqual(sut.groceryToBuyCount, 1)
        XCTAssertEqual(sut.groceryFoundCount, 1)

        sut.clearArray()
        
        XCTAssertEqual(sut.groceryToBuyCount, 0)
        XCTAssertEqual(sut.groceryFoundCount, 0)
        
    }
    
    // MARK:- Duplicate Tests
    func testDuplicateGroceries_ShouldNotBeAddedToArray() {
        sut.addGrocery(grocery: cookies)
        sut.addGrocery(grocery: cookies)
        
        XCTAssertEqual(sut.groceryToBuyCount, 1)
    }
    
}
