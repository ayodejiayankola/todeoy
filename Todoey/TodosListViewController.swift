//
//  ViewController.swift
//  Todoey
//
//  Created by Ayodeji Ayankola on 3/12/21.
//

import UIKit

class TodosListViewController: UITableViewController {

    let items = ["Item One" , "Item Two" , "Item Three"]
    
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
    
}

