//
//  ViewController.swift
//  Journal
//
//  Created by Sean Manley on 6/9/16.
//  Copyright © 2016 Sean Manley. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {

    var journals:[Journal] = []
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        
        let appDelegate = (UIApplication.sharedApplication().delegate as? AppDelegate)
        let context = appDelegate?.managedObjectContext
        let request = NSFetchRequest(entityName: "Journal")
        
        do {
            let results = try context?.executeFetchRequest(request)
            self.journals.appendContentsOf(results as! [Journal])
        } catch _ {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journals.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("JournalCell") {
            cell.textLabel?.text = "Test"
            return cell
        } else {
            return UITableViewCell()
        }
    }
    @IBAction func addPressed(sender: AnyObject) {
        
    }
}

