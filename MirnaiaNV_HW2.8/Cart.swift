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
    
    var amount: Double {
        (100 * Double(quantity) * resource.price).rounded() / 100
    }
}

class Cart {
    
    static let instance = Cart()
    
    private var items: [Int:CartItem] = [:]
     
    var cartQuantity: Int {
        var quantity = 0
        for (_, item) in items {
            quantity += item.quantity
        }
        return quantity
    }
    
    var cartAmount: Double {
        var amount = 0.0
        for (_, item) in items {
            amount += item.amount
        }
        return (100 * amount).rounded() / 100
    }
    
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
    
    func getCartItemsArray() -> [CartItem] {
        var result: [CartItem] = []
        for (_, item) in items {
            result.append(item)
        }
        return result
    }
    
}
