//
//  ViewController.swift
//  To Do
//
//  Created by Carter Reed on 6/20/19.
//  Copyright © 2019 Carter Reed. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {

    var itemArray = [Item]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
            super.viewDidLoad()

        
        
        print(dataFilePath)

loadItems()
        
//        if let items = Array(arrayLiteral: "TodoListArray") as? [Item]{
//
// itemArray = items
//
//        }

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    
        let item = itemArray[indexPath.row]
        
            cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        print(itemArray[indexPath.row])
    
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        saveItems()
    
            tableView.deselectRow(at: indexPath, animated: true)
    
    }
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        

        let alert = UIAlertController(title: "Add new to do item", message: "This will add an item to your To Do List.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            // what will happen once the user clicks the add item button on our UIAlert.
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.saveItems()
            
        }
   
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        
        }
        
    alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        }

    




func saveItems() {
    
    let encoder = PropertyListEncoder()
    
    do {
        
        let data = try encoder.encode(itemArray)
        try data.write(to: dataFilePath! )
        
    } catch {
        print("-------------error encoding item array, \(error)-------------")
        
    }
    
    self.tableView.reloadData()
    

    }

    func loadItems() {
        
        if let data = try? Data(contentsOf: dataFilePath!) {
            
                let decoder = PropertyListDecoder()
            
            do {
                
                itemArray = try decoder.decode([Item].self, from: data)
                
            } catch {
                
                print("Error decoding item array, \(error)")
                
            }
            
        }
        
        
        
    }
    
}
