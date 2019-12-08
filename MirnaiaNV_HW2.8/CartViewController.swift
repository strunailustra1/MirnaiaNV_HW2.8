//
//  CartViewController.swift
//  MirnaiaNV_HW2.8
//
//  Created by Наталья Мирная on 08/12/2019.
//  Copyright © 2019 Наталья Мирная. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "detail" {
//            let detailVC = segue.destination as! ResourceDetailViewController
//            detailVC.resource = sender as? Resource
//        }
//    }
}

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resourceItem", for: indexPath) as! ResourceCell

//        cell.articleLabel.text = resourceList[indexPath.row].article
//        cell.brandLabel.text = resourceList[indexPath.row].brand
//        cell.namelabel.text = resourceList[indexPath.row].name
//        cell.priceLabel.text = String(resourceList[indexPath.row].price)

        return cell
    }
}

extension CartViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let resource = resourceList[indexPath.row]
//        performSegue(withIdentifier: "detail", sender: resource)
//    }
}

