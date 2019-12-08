//
//  ResourceDetail.swift
//  MirnaiaNV_HW2.8
//
//  Created by Наталья Мирная on 08/12/2019.
//  Copyright © 2019 Наталья Мирная. All rights reserved.
//

import UIKit

enum CartButtonTitle: String {
    case add = "Положить в корзину"
    case change = "Изменить количество"
    case remove = "Удалить из корзины"
}

class ResourceDetailViewController: UIViewController {
    var resource: Resource!
    
    @IBOutlet var imageResource: UIImageView!
    @IBOutlet var brandLabel: UILabel!
    @IBOutlet var articleLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var quantityLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    @IBOutlet var quantityStepper: UIStepper!
    @IBOutlet var addToCartButton: UIButton!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        brandLabel.text = resource.brand
        articleLabel.text = resource.article
        nameLabel.text = resource.name
        priceLabel.text = String(resource.price)
        
        if let cartItem = Cart.instance.getCartItems()[resource.id] {
            quantityStepper.value = Double(cartItem.quantity)
            addToCartButton.setTitle(CartButtonTitle.change.rawValue, for: .normal)
        }
        
        changeAmount()
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func quantityChange() {
        changeAmount()
        changeButtonTitle()
    }
    
    @IBAction func addToCart() {
        Cart.instance.addToCart(
            cartItem: CartItem(
                quantity: Int(quantityStepper.value),
                resource: resource
            )
        )
        
        changeButtonTitle()
    }
    
    private func changeButtonTitle() {
        let inCart = Cart.instance.getCartItems()[resource.id] != nil
        
        if inCart && quantityStepper.value > 0 {
            addToCartButton.setTitle(CartButtonTitle.change.rawValue, for: .normal)
        } else if quantityStepper.value > 0 {
            addToCartButton.setTitle(CartButtonTitle.add.rawValue, for: .normal)
        } else {
            addToCartButton.setTitle(CartButtonTitle.remove.rawValue, for: .normal)
        }
    }
    
    private func changeAmount() {
        let quantity = quantityStepper.value
        quantityLabel.text = String(Int(quantity))
        amountLabel.text = String(quantity * resource.price)
    }
}
