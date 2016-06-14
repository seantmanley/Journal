//
//  EntryTypeContentProvider.swift
//  Journal
//
//  Created by Zachary Heusinkveld on 6/13/16.
//  Copyright © 2016 Sean Manley. All rights reserved.
//

import UIKit

class EntryTypeContentProvider: BaseContentProvider {

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

}
