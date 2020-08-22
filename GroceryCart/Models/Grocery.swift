//
//  Grocery.swift
//  GroceryCart
//
//  Created by ESSA AL on 8/21/20.
//  Copyright © 2020 ESSA ALDOWAIHES. All rights reserved.
//

import Foundation

struct Grocery {
    let itemName: String
    let brandName: String?
    
    init(itemName: String, brandName: String? = nil) {
        self.itemName = itemName
        self.brandName = brandName
    }
}
