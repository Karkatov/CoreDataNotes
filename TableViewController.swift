//
//  TableViewController.swift
//  ShopApp
//
//  Created by Duxxless on 12.04.2022.
//

import UIKit

class TableViewController: UITableViewController {

    private let identifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
    }

    
    private func setTableView() {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        navigationItem.leftBarButtonItem = self.editButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAlert))
    }
    
    @objc func showAlert() {
        
    }
}
    
    extension TableViewController {
        
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)

        cell.textLabel?.text = "111"
        return cell
    }

}
