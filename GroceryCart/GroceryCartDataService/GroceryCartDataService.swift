//
//  GroceryCartDataService.swift
//  GroceryCart
//
//  Created by ESSA AL.
//

import UIKit

enum GrocerySection: Int {
    case groceryToBuy
    case groceryFound
}

class GroceryCartDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var groceryManager: GroceryManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let groceryManager = groceryManager else { return 0 }
        guard let grocerySection = GrocerySection(rawValue: section) else { fatalError() }
        
        switch grocerySection {
            case .groceryToBuy:
                return groceryManager.groceryToBuyCount
            case .groceryFound:
                return groceryManager.groceryFoundCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let groceryManager = groceryManager else { fatalError() }
        guard let grocerySection = GrocerySection(rawValue: indexPath.section) else { fatalError() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: grocery_cell_id, for: indexPath) as! GroceryCell
        
        let groceryData = grocerySection.rawValue == 0 ?
            groceryManager.groceryAtIndex(index: indexPath.row) :
            groceryManager.checkedOffGroceryAtIndex(index: indexPath.row)

        cell.configGroceryCell(grocery: groceryData)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let groceryManager = groceryManager else { fatalError() }
        guard let grocerySection = GrocerySection(rawValue: indexPath.section) else { fatalError() }

        if grocerySection == .groceryToBuy {
            groceryManager.checkOffGroceryAtIndex(index: indexPath.row)
            tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let grocerySection = GrocerySection(rawValue: section) else { fatalError() }
        let numberOfGroceriesToBuy = groceryManager?.groceryToBuyCount ?? 0
        let sectionTitle = grocerySection.rawValue == 0
            ? numberOfGroceriesToBuy < 2 ? "\(numberOfGroceriesToBuy) Item" : "\(numberOfGroceriesToBuy) Items"
            : "Checked Off"
        
        return sectionTitle
    }
    
}
