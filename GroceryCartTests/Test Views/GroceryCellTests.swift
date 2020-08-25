//
//  GroceryCellTests.swift
//  GroceryCartTests
//
//  Created by ESSA AL.
//

import XCTest
@testable import GroceryCart

class GroceryCellTests: XCTestCase {

    var tableView: UITableView!
    var mockDataSource: MockCellDataSource!
    
    override func setUp() {
        let groceryVC = GroceryViewController()
        _ = groceryVC.view
        
        tableView = groceryVC.groceryTableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK:-
    func testCell_Config_ShouldSetLabelsToGroceryData() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceryCell",
                                                 for: IndexPath(row: 0, section: 0)) as! GroceryCell
        
        cell.configGroceryCell(grocery: Grocery(itemName: "Fruits", note: "Whatever Brand"))
        
        XCTAssertEqual(cell.itemLabel.text, "Fruits")
        XCTAssertEqual(cell.noteLabel.text, "Whatever Brand")
    }

    

}
