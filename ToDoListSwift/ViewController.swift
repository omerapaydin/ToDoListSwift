//
//  ViewController.swift
//  ToDoListSwift
//
//  Created by Ömer on 2.02.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var toDoList  = [String]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }

    @IBAction func addClicked(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Item", message: "Enter your item", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Enter your item"
        }
        
        let okButton = UIAlertAction(title: "OK", style: .default) { (_) in
            if let textField = alert.textFields?.first, !textField.text!.isEmpty {
                self.toDoList.append(textField.text!)
                self.tableView.reloadData()
            }
        }
        
        alert.addAction(okButton)
        self.present(alert, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration( )
        content.text = toDoList[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.toDoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    
}

