//
//  ViewController.swift
//  Todoey
//
//  Created by Ayodeji Ayankola on 3/12/21.
//

import UIKit

class TodosListViewController: UITableViewController {

    var items = ["Item One" , "Item Two" , "Item Three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

  //MARK:- TableView Data Source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
//             let messageArray = ["First Message", "Second Message", "Third Message"]
//             cell.messageBody.text = messageArray[indexPath.row]
//             return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    
    // MARK:- Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(items[indexPath.row])
//        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated:true)
    }
    
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "" , preferredStyle: .alert)
        let action = UIAlertAction(title: "Add New Item", style: .default) { (action) in
            self.items.append(textField.text!)
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil
        )
//        alert.addAction(action)
//        present(alert, animated: true, completion: nil
    }
    
}

