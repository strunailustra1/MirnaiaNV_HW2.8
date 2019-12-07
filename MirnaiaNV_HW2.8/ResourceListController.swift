//
//  ViewController.swift
//  MirnaiaNV_HW2.8
//
//  Created by Наталья Мирная on 07/12/2019.
//  Copyright © 2019 Наталья Мирная. All rights reserved.
//

import UIKit

class ResourceListController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ResourceListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resourceItem", for: indexPath)
        
        cell.textLabel?.text = "Cell \(indexPath.row)"
        
        return cell
    }
}

extension ResourceListController: UITableViewDelegate {
    
}
