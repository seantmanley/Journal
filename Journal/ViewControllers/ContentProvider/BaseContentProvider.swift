//
//  BaseContentProvider.swift
//  Journal
//
//  Created by Zachary Heusinkveld on 6/13/16.
//  Copyright © 2016 Sean Manley. All rights reserved.
//

import UIKit
import CoreData

class BaseContentProvider: NSObject {
    
    let context = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext

    func getEntity(entityName: String) {
        let request = NSFetchRequest(entityName: entityName)
        if let results = context?.executeRequest(request) {
            return results
        }
    }
}
