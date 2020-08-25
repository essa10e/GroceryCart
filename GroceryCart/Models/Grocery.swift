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
    let amount: Int
    
    init(itemName: String, note: String? = nil, amount: Int = 1) {
        self.itemName = itemName
        self.note = note
        self.amount = amount
    }
}

func==(lhs: Grocery, rhs: Grocery) -> Bool {
    
    if lhs.itemName != rhs.itemName {
        return false
    }
    
    if lhs.note != rhs.note {
        return false
    }
    
    if lhs.amount != rhs.amount {
        return false
    }
    
    return true
}
