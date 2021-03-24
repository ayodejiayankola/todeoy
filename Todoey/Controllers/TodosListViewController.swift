//
//  ViewController.swift
//  Todoey
//
//  Created by Ayodeji Ayankola on 3/12/21.
//

import UIKit

class TodosListViewController: UITableViewController {
    
    
    var items = [Item]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Item One"
        items.append(newItem)
        let newItem2 = Item()
        newItem2.title = "Item Two"
        items.append(newItem2)
        let newItem3 = Item()
        newItem3.title = "Item Three"
        items.append(newItem3)
        
        // Do any additional setup after loading the view.
        //        if let item = defaults.array(forKey: "TodoListArray") as? [String] {
        //            items = item
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
        
        let itemData = items[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemData.title
        
        //ternary operator
        //value = condition ? valuIfTrue : valueIfFalse
        
        //        cell.accessoryType = itemData.done == true ? .checkmark :  .none
        cell.accessoryType = itemData.done  ? .checkmark :  .none
        //        if itemData.done == true {
        //            cell.accessoryType = .checkmark
        //        } else {
        //            cell.accessoryType = .none
        //        }
        return cell
    }
    
    
    // MARK:- Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(items[indexPath.row])
        items[indexPath.row].done = !items[indexPath.row].done
        //        if items[indexPath.row].done == false {
        //            items[indexPath.row].done = true
        //        } else {
        //            items[indexPath.row].done = false
        //        }
        //        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        //        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
        //            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        //        } else {
        //            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        //        }
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated:true)
    }
    
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "" , preferredStyle: .alert)
        let action = UIAlertAction(title: "Add New Item", style: .default) { (action) in
            let newItem = Item()
            newItem.title = textField.text!
            self.items.append(newItem)
            self.defaults.set(self.items, forKey: "TodoListArray")
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

