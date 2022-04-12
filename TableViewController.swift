//
//  TableViewController.swift
//  ShopApp
//
//  Created by Duxxless on 12.04.2022.
//

import UIKit

class TableViewController: UITableViewController {

    private let identifier = "Cell"
    private var tasks: [String] = ["Hello", "GoodBay"]
    
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
        
        let alert = UIAlertController(title: "New task", message: nil, preferredStyle: .alert)
        let addTaskAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let optionalTask = alert.textFields?.first, let task = optionalTask.text, task != "" else { return }
            tasks.insert(task, at: 0)
        }
    }
}
    
    extension TableViewController {
        
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)

        let task = tasks[indexPath.row]
        cell.textLabel?.text = task
        return cell
    }

}
