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
    let amount: Int
    
    init(itemName: String, brandName: String? = nil, amount: Int = 1) {
        self.itemName = itemName
        self.brandName = brandName
        self.amount = amount
    }
}

func==(lhs: Grocery, rhs: Grocery) -> Bool {
    
    if lhs.itemName != rhs.itemName {
        return false
    }
    
    if lhs.brandName != rhs.brandName {
        return false
    }
    
    if lhs.amount != rhs.amount {
        return false
    }
    
    return true
}
