//
//  ViewController.swift
//  MirnaiaNV_HW2.8
//
//  Created by Наталья Мирная on 07/12/2019.
//  Copyright © 2019 Наталья Мирная. All rights reserved.
//

import UIKit

class ResourceListController: UIViewController {

    var resourceList: [Resource] = []
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ResourceListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        resourceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resourceItem", for: indexPath)
        
        cell.textLabel?.text = resourceList[indexPath.row].article
        
        return cell
    }
}

extension ResourceListController: UITableViewDelegate {
    
}

extension ResourceListController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var searchString = textField.text!
        if string.count > 0 {
            searchString += string
        } else {
            searchString.removeLast()
        }
        searchString = searchString.lowercased()
        
        resourceList = []
        for resource in Resource.getResourceList() {
            if resource.searchText.range(of: searchString) != nil {
                resourceList.append(resource)
            }
        }
        
        tableView.reloadData()
        
        return true
    }
}
