//
//  AddItemTableViewControllerDelegate.swift
//  Bucket List
//
//  Created by λΌμ π on 27/04/1444 AH.
//

import UIKit

protocol AddItemTableViewControllerDelegate: class {
    func cancelButtonPressed(by controller: UIViewController)
    func addButtonPressed(by controller: UIViewController ,newItem: String, atindexPath: NSIndexPath?)
}
