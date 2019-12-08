//
//  CartViewController.swift
//  MirnaiaNV_HW2.8
//
//  Created by Наталья Мирная on 08/12/2019.
//  Copyright © 2019 Наталья Мирная. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet var quantityCartLabel: UILabel!
    @IBOutlet var amountCartLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    let cart = Cart.instance
    
    var cartItems: [CartItem]!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        quantityCartLabel.text = String(cart.cartQuantity)
        amountCartLabel.text = String(cart.cartAmount)
        cartItems = cart.getCartItemsArray()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resourceItem" else { return }
        if let indexPath = tableView.indexPathForSelectedRow {
            let detailVC = segue.destination as! ResourceDetailViewController
            detailVC.resource = cartItems[indexPath.row].resource
        }
    }
}

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartItem", for: indexPath) as! ResourceCell

        cell.articleLabel.text = cartItems[indexPath.row].resource.article
        cell.brandLabel.text = cartItems[indexPath.row].resource.brand
        cell.namelabel.text = cartItems[indexPath.row].resource.name
        cell.priceLabel.text = String(cartItems[indexPath.row].resource.price)
        cell.quantityLabel.text = String(cartItems[indexPath.row].quantity)
        cell.amountLabel.text = String(cartItems[indexPath.row].amount)

        return cell
    }
}

extension CartViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let resource = resourceList[indexPath.row]
//        performSegue(withIdentifier: "detail", sender: resource)
//    }
}

