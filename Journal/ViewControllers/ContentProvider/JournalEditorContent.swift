//
//  JournalEditorContent.swift
//  Journal
//
//  Created by Zachary Heusinkveld on 6/13/16.
//  Copyright © 2016 Sean Manley. All rights reserved.
//

import UIKit

class JournalEditorContent: BaseContentProvider, UITableViewDataSource {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
