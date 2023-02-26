//
//  AddItemsTableViewController.swift
//  Bucket List
//
//  Created by 라완 💕 on 27/04/1444 AH.
//

import UIKit

class AddItemsTableViewController: UITableViewController {

    weak var delegate: AddItemTableViewControllerDelegate?
    var item: String?
    var indexPath: NSIndexPath?

    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        let text = itemTextField.text!
        delegate?.addButtonPressed(by: self, newItem: itemTextField.text ?? "", atindexPath: indexPath)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTextField.text = item
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
