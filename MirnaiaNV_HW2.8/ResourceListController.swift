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
        
        tableView.estimatedRowHeight = 92
        tableView.rowHeight = UITableView.automaticDimension
        
        hideKeyboardWhenTappedAround()
    }
}

extension ResourceListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        resourceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resourceItem", for: indexPath) as! ResourceCell
        
        cell.articleLabel.text = resourceList[indexPath.row].article
        cell.brandLabel.text = resourceList[indexPath.row].brand
        cell.namelabel.text = resourceList[indexPath.row].name
        cell.priceLabel.text = String(resourceList[indexPath.row].price)
        
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        resourceList = []
        tableView.reloadData()
        
        return true
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
