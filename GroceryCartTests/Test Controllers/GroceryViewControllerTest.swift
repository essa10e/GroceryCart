//
//  LibraryViewControllerTest.swift
//  GroceryCartTests
//
//  Created by ESSA AL.
//

import XCTest
@testable import GroceryCart

class GroceryViewControllerTest: XCTestCase {

    var sut: GroceryViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = GroceryViewController()
        _ = sut.view
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK:- TableView Test - Checks Nil
    func testGroceryVC_TableViewShouldNotBeNil() {
        XCTAssertNotNil(sut.groceryTableView)
    }

    // MARK:- DataSource Test
    func testDataSource_ViewDidLoad_SetsTableViewDataSource() {
        XCTAssertNotNil(sut.groceryTableView.dataSource)
        XCTAssertTrue(sut.groceryTableView.dataSource is GroceryCartDataService)
    }
    
    // MARK:- Delegate Test
    func testDelegate_ViewDidLoad_SetsTableViewDelegate() {
        XCTAssertNotNil(sut.groceryTableView.delegate)
        XCTAssertTrue(sut.groceryTableView.delegate is GroceryCartDataService)
    }
   
    // MARK:- Data Service Assumptions
    func testDataService_ViewDidLoad_SetsSingleDataServiceObject() {
        XCTAssertEqual(sut.groceryTableView.dataSource as! GroceryCartDataService,
                       sut.groceryTableView.delegate as! GroceryCartDataService)
    }

    
}
