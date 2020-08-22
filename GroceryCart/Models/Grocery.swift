//
//  Grocery.swift
//  GroceryCart
//
//  Created by ESSA AL.
//

import Foundation

struct Grocery: Equatable {
    let itemName: String
    let brandName: String?
    
    init(itemName: String, brandName: String? = nil) {
        self.itemName = itemName
        self.brandName = brandName
    }
}

func==(lhs: Grocery, rhs: Grocery) -> Bool {
    
    if lhs.itemName != rhs.itemName {
        return false
    }
    
    if lhs.brandName != rhs.brandName {
        return false
    }
    
    return true
}
