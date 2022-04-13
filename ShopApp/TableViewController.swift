//
//  TableViewController.swift
//  ShopApp
//
//  Created by Duxxless on 12.04.2022.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    private let identifier = "Cell"
    var tasks: [Task] = []
    var context: NSManagedObjectContext!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let fetchRequest = Task.fetchRequest()
        
        do {
            tasks = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    private func setTableView() {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        navigationItem.leftBarButtonItem = self.editButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showAlert))
    }
    
    @objc func showAlert() {
        
        let alert = UIAlertController(title: "New task", message: nil, preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let optionalTask = alert.textFields?.first, let newTask = optionalTask.text, newTask != "" else { return }
            self?.saveTask(withTittle: newTask)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alert.addTextField { tf in
            tf.placeholder = "Example: cleaning needs to be done"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    private func saveTask(withTittle title: String) {
        guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: context) else { return }
        let taskObject = Task(entity: entity, insertInto: context)
        taskObject.tittle = title
        
        do {
            try context.save()
            
            tasks.insert(taskObject, at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        } catch let error as NSError {
            print(error.localizedDescription)
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

        let task = tasks[indexPath.row].tittle
        cell.textLabel?.text = task
        return cell
    }

}
