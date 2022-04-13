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
        //deleteTasks()
        setTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let fetchRequest = Task.fetchRequest()
        let sortDescription = NSSortDescriptor(key: "title", ascending: false)
        fetchRequest.sortDescriptors = [sortDescription]
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
            self?.saveTask(withTitle: newTask)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alert.addTextField { tf in
            tf.placeholder = "Example: cleaning needs to be done"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    private func saveTask(withTitle title: String) {
        guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: context) else { return }
        let taskObject = Task(entity: entity, insertInto: context)
        taskObject.title = title
        
        do {
            try context.save()
            
            tasks.insert(taskObject, at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    private func deleteTasks() {
        
        let fetchRequest = Task.fetchRequest()
        guard let objects = try? context.fetch(fetchRequest) else { return }
        for object in objects {
            context.delete(object)
        }
        do {
            try context.save()
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

        let task = tasks[indexPath.row].title
        cell.textLabel?.text = task
        return cell
    }
        
        override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            .delete
        }
        
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
            let fetchRequest = Task.fetchRequest()
            guard let objects = try? context.fetch(fetchRequest) else { return }
            context.delete(objects[indexPath.row])
            do {
                try context.save()

            } catch let error as NSError {
                print(error.localizedDescription)
            }
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            print("Del")
        }

}
