//
//  AddJournalEntry.swift
//  Journal
//
//  Created by Sean Manley on 6/9/16.
//  Copyright © 2016 Sean Manley. All rights reserved.
//

import UIKit

class AddJournalEntryViewController: UIViewController {

    var entryType:EntryType? {
        didSet {
            if let name = entryType?.name {
                self.title = "New \(name) Entry"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func savePressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
