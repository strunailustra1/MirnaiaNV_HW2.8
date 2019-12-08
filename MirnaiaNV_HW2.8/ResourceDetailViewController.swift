//
//  ResourceDetail.swift
//  MirnaiaNV_HW2.8
//
//  Created by Наталья Мирная on 08/12/2019.
//  Copyright © 2019 Наталья Мирная. All rights reserved.
//

import UIKit
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brandLabel.text = resource.brand
        articleLabel.text = resource.article
        nameLabel.text = resource.name
        priceLabel.text = String(resource.price)
        
        changeAmount()
    }
    
    @IBAction func quantityChange() {
        changeAmount()
    }
    
    private func changeAmount() {
        let quantity = quantityStepper.value
        quantityLabel.text = String(Int(quantity))
        amountLabel.text = String(quantity * resource.price)
    }
}
