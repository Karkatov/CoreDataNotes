//
//  TableTableViewController.swift
//  ShopApp
//
//  Created by Duxxless on 27.03.2022.
//

import UIKit

class TableTableViewController: UITableViewController {
    let identifier = "myCell"
    var products = ["1", "2", "3", "4", "5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let myView = SecondViewController()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        title = "Test"
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = products[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

