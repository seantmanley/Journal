//
//  AddJournalViewController.swift
//  Journal
//
//  Created by Sean Manley on 6/9/16.
//  Copyright © 2016 Sean Manley. All rights reserved.
//

import UIKit
import CoreData

class AddJournalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var entryTypes:[EntryType] = []
    var selectedEntryTypes:[EntryType] = []
    
    @IBOutlet weak var newEntryType: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newJournal: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func fetchEntryTypes() -> [EntryType] {
        let appDelegate = (UIApplication.sharedApplication().delegate as? AppDelegate)
        let context = appDelegate?.managedObjectContext
        let request = NSFetchRequest(entityName: "EntryType")

        do {
            let results = try context?.executeFetchRequest(request)
            self.entryTypes = results as! [EntryType]
        } catch _ {
            
        }
        return []
    }
    
    @IBAction func addPressed(sender: AnyObject) {
        let appDelegate = (UIApplication.sharedApplication().delegate as? AppDelegate)
        let context = appDelegate?.managedObjectContext
        let journal:Journal = NSEntityDescription.insertNewObjectForEntityForName("Journal", inManagedObjectContext: context!) as! Journal
        journal.name = self.newJournal.text
        
    }
    
    @IBAction func cancelPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addNewEntryType(sender: AnyObject) {
        let appDelegate = (UIApplication.sharedApplication().delegate as? AppDelegate)
        let context = appDelegate?.managedObjectContext
        let entity:EntryType = NSEntityDescription.insertNewObjectForEntityForName("EntryType", inManagedObjectContext: context!) as! EntryType
        
        entity.name = self.newEntryType.text
        
        do {
            try context!.save()
        } catch _ {
            
        }
        
        self.tableView.reloadData()
    }
    @IBAction func addNewJournal(sender: AnyObject) {
        let appDelegate = (UIApplication.sharedApplication().delegate as? AppDelegate)
        let context = appDelegate?.managedObjectContext
        let entity:EntryType = NSEntityDescription.insertNewObjectForEntityForName("Journal", inManagedObjectContext: context!) as! EntryType
        
        entity.name = self.newJournal.text
        
//        entity.entries = self.table
        
        do {
            try context!.save()
        } catch _ {
            
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchEntryTypes()
        return entryTypes.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("CheckCell") {
            cell.textLabel?.text = entryTypes[indexPath.row].name
            if self.selectedEntryTypes.contains(entryTypes[indexPath.row]) {
                cell.selected = true
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedEntryTypes.append(self.entryTypes[indexPath.row])
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let index = self.selectedEntryTypes.indexOf(self.entryTypes[indexPath.row])
        self.selectedEntryTypes.removeAtIndex(index!)
    }
}
