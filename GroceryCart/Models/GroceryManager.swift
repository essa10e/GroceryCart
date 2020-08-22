//
//  GroceryManager.swift
//  GroceryCart
//
//  Created by ESSA AL.
//

import Foundation

class GroceryManager {
    var groceryToBuyCount: Int { return groceryToBuyArray.count }
    var groceryFoundCount: Int { return groceryFoundArray.count }
    
    private var groceryToBuyArray = [Grocery]()
    private var groceryFoundArray = [Grocery]()
    
    func addGrocery(grocery: Grocery) {
        if !groceryToBuyArray.contains(grocery) {
            groceryToBuyArray.append(grocery)
        }
    }
    
    func groceryAtIndex(index: Int) -> Grocery {
        return groceryToBuyArray[index]
    }
    
    func checkOffGroceryAtIndex(index: Int) {
        guard index < groceryToBuyCount else {return}
        
        let checkedOffGrocery = groceryToBuyArray.remove(at: index)
        groceryFoundArray.append(checkedOffGrocery)
    }
    
    func checkedOffGroceryAtIndex(index: Int) -> Grocery {
        return groceryFoundArray[index]
    }
    
    func clearArray() {
        groceryToBuyArray.removeAll()
        groceryFoundArray.removeAll()
    }
}
