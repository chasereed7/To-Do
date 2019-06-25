//
//  ViewController.swift
//  To Do
//
//  Created by Carter Reed on 6/20/19.
//  Copyright © 2019 Carter Reed. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {

    var itemArray = [ "Find Mike", "Buy Eggos", "Destroy Demogorgon"]
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
            super.viewDidLoad()

        if let itemArray = defaults.array(forKey: "ToDoListArray") as? [String] {
            
            
        }

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
    
        
    if tableView.cellForRow(at: indexPath)?.accessoryType == .none {
            
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
    }else{
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .none

        
        }
        
            tableView.deselectRow(at: indexPath, animated: true)
    
    }
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        

        let alert = UIAlertController(title: "Add new to do item", message: "This will add an item to your To Do List.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            // what will happen once the user clicks the add item button on our UIAlert.
            
            self.itemArray.append(textField.text!)
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
            
        }
   
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creat new item"
            textField = alertTextField
        
        }
        
    alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        }

    }


