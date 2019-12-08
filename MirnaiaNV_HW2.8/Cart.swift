//
//  Cart.swift
//  MirnaiaNV_HW2.8
//
//  Created by Наталья Мирная on 08/12/2019.
//  Copyright © 2019 Наталья Мирная. All rights reserved.
//

import Foundation

struct CartItem {
    let quantity: Int
    let resource: Resource
}

class Cart {
    
    static let instance = Cart()
    
    private var items: [Int:CartItem] = [:]
    
    func addToCart(cartItem: CartItem) {
        if cartItem.quantity > 0 {
            items[cartItem.resource.id] = cartItem
        } else {
            items[cartItem.resource.id] = nil
        }
    }
    
    func getCartItems() -> [Int:CartItem] {
        items
    }
}
