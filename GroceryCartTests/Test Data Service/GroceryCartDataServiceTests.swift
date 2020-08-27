//
//  GroceryCartDataServiceTests.swift
//  GroceryCartTests
//
//  Created by ESSA AL.
//

import XCTest
@testable import GroceryCart

class GroceryCartDataServiceTests: XCTestCase {

    var sut: GroceryCartDataService!
    var groceryTableView: UITableView!
    var groceryVC: GroceryViewController!
    var tableViewMock: TableViewMock!
    
    let cookies = Grocery(itemName: "Cookie")
    let toothPaste = Grocery(itemName: "Tooth Paste")
    let softSoda = Grocery(itemName: "Soft soda")
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = GroceryCartDataService()
        sut.groceryManager = GroceryManager()
        
        tableViewMock = TableViewMock.initMock(dataSource: sut)
        
        groceryVC = GroceryViewController()
        _ = groceryVC.view
        
        groceryTableView = groceryVC.groceryTableView
        groceryTableView.dataSource = sut
        groceryTableView.delegate = sut
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK:- Section Tests
    func testTableViewSections_Counts_ReturnsTwo() {
        let sections = groceryTableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }

    func testTableViewSection_SectionOne_ReturnsGroceryToBuyCount() {
        sut.groceryManager?.addGrocery(grocery: cookies)
        sut.groceryManager?.addGrocery(grocery: toothPaste)
        
        XCTAssertEqual(groceryTableView.numberOfRows(inSection: 0), 2)
        
        sut.groceryManager?.addGrocery(grocery: softSoda)
        
        groceryTableView.reloadData()
        
        XCTAssertEqual(groceryTableView.numberOfRows(inSection: 0), 3)
    }
    
    func testTableViewSection_SectionTwo_ReturnsGroceryToBuyCount() {
        sut.groceryManager?.addGrocery(grocery: cookies)
        sut.groceryManager?.addGrocery(grocery: toothPaste)
        
        sut.groceryManager?.checkOffGroceryAtIndex(index: 0)
        XCTAssertEqual(groceryTableView.numberOfRows(inSection: 1), 1)
        
        sut.groceryManager?.checkOffGroceryAtIndex(index: 0)

        groceryTableView.reloadData()
        
        XCTAssertEqual(groceryTableView.numberOfRows(inSection: 1), 2)
    }
    
    // MARK:- Cells Tests
    func testCell_RowAtIndex_ReturnGroceryCell() {
        sut.groceryManager?.addGrocery(grocery: cookies)
        groceryTableView.reloadData()
        
        // This will no longer works because I added the mock model which has different CELL MODEL.
        //let cellQueried = groceryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
    
        //XCTAssertTrue(cellQueried is GroceryCell)
    }
    
    func testCell_ShouldDequeuCell() {
        
        sut.groceryManager?.addGrocery(grocery: cookies)
        tableViewMock.reloadData()
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(tableViewMock.cellDequeuedProperly)
    }
    
    func testCell_SectionOneConfig_ShouldSetCellData() {
        
        sut.groceryManager?.addGrocery(grocery: cookies)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! GroceryCellMock
        
        XCTAssertEqual(cell.groceryData, cookies)
    }
    
    func testCell_SectionTwoConfig_ShouldSetCellData() {
        sut.groceryManager?.addGrocery(grocery: toothPaste)
        sut.groceryManager?.addGrocery(grocery: softSoda)
        sut.groceryManager?.checkOffGroceryAtIndex(index: 0)

        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! GroceryCellMock
        
        XCTAssertEqual(cell.groceryData, toothPaste)
    }
    
    func testCell_Selection_ShouldCheckOffSelectedGrocery() {
        sut.groceryManager?.addGrocery(grocery: toothPaste)
        sut.groceryManager?.addGrocery(grocery: softSoda)
        
        groceryTableView.delegate?.tableView!(groceryTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.groceryManager?.groceryToBuyCount, 1)
        XCTAssertEqual(sut.groceryManager?.groceryFoundCount, 1)
        
        XCTAssertEqual(groceryTableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(groceryTableView.numberOfRows(inSection: 1), 1)

    }
    
    func testTableViewSectionTitles_ShouldHaveCorrectStringValues() {
        let sectionOneTitle = groceryTableView.dataSource?.tableView!(groceryTableView, titleForHeaderInSection: 0)
        let sectionTwoTitle = groceryTableView.dataSource?.tableView!(groceryTableView, titleForHeaderInSection: 1)
        
        XCTAssertEqual(sectionOneTitle, "0 Item")
        XCTAssertEqual(sectionTwoTitle, "Checked Off")

    }
    
}


