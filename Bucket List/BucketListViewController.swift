//
//  ViewController.swift
//  Bucket List
//
//  Created by 라완 💕 on 27/04/1444 AH.
//

import UIKit


class BucketListViewController: UITableViewController, AddItemTableViewControllerDelegate {
    
    var items = ["Go to the moon","Visit Tokyo","Visit Italy"]
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext


    override func viewDidLoad() {
        super.viewDidLoad()
        //fetchAllItems()
    }
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "EditItemSegue", sender: sender)
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemsCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       //print("Nothing will happin")
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade )
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navContr = segue.destination as! UINavigationController
        let addItemVw = navContr.topViewController as! AddItemsTableViewController
        if sender is UIBarButtonItem {
            addItemVw.delegate = self
        }
        else if sender is IndexPath {
            addItemVw.delegate = self
            let indx = sender as! NSIndexPath
            addItemVw.item = items[indx.row]
            addItemVw.indexPath = indx
            
        }
        
       
    }
    
    func cancelButtonPressed(by controller: UIViewController) {
        dismiss(animated: true)
    }
  
    func addButtonPressed(by controller: UIViewController, newItem: String,  atindexPath: NSIndexPath?) {
        if newItem != "" {
            if let indx = atindexPath{
                items[indx.row] = newItem
            }
            else
            {
                items.append(newItem)
            }
        }
        tableView.reloadData()
        dismiss(animated: true)
    }
    
    
}

