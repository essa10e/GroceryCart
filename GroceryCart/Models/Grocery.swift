//
//  Grocery.swift
//  GroceryCart
//
//  Created by ESSA AL.
//

import Foundation

struct Grocery: Equatable {
    let itemName: String
    let note: String?
    let quantity: Int
    
    init(itemName: String, note: String? = nil, quantity: Int = 1) {
        self.itemName = itemName
        self.note = note
        self.quantity = quantity
    }
}

func==(lhs: Grocery, rhs: Grocery) -> Bool {
    
    if lhs.itemName != rhs.itemName {
        return false
    }
    
    if lhs.note != rhs.note {
        return false
    }
    
    if lhs.quantity != rhs.quantity {
        return false
    }
    
    return true
}
