//
//  ViewController.swift
//  To Do
//
//  Created by Carter Reed on 6/20/19.
//  Copyright © 2019 Carter Reed. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {

            let itemArray = ["To Do:", "1. Wake Up", "2. Make Coffee", "3. Drink Coffee", "4. Make More Coffee"]
    
    override func viewDidLoad() {
            super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    
            cell.textLabel?.text = itemArray[indexPath.row]
        
            return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        print(itemArray[indexPath.row])
    
        
    if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
    }else{
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        }
        
            tableView.deselectRow(at: indexPath, animated: true)
    
    }
    
}

