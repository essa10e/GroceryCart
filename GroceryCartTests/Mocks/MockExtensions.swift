//
//  MockExtensions.swift
//  GroceryCartTests
//
//  Created by ESSA AL.
//

import Foundation
import UIKit
@testable import GroceryCart

extension GroceryCartDataServiceTests {
    class TableViewMock: UITableView {
        var cellDequeuedProperly = false
        
        class func initMock(dataSource: GroceryCartDataService) -> TableViewMock {
            let mock = TableViewMock(frame: CGRect(x: 0, y: 0, width: 250, height: 500), style: .plain)
            mock.dataSource = dataSource
            mock.register(GroceryCellMock.self, forCellReuseIdentifier: "groceryCell")
            
            return mock
        }
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class GroceryCellMock: GroceryCell {
        var groceryData: Grocery?
        
        override func configGroceryCell(grocery: Grocery) {
            groceryData = grocery
        }
    }
}








extension GroceryCellTests {
    class MockCellDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
        
    }
}
