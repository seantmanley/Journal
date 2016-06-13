//
//  EntryType+CoreDataProperties.swift
//  Journal
//
//  Created by Zachary Heusinkveld on 6/12/16.
//  Copyright © 2016 Sean Manley. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension EntryType {

    @NSManaged var imageBin: NSData?
    @NSManaged var imageName: String?
    @NSManaged var name: String?
    @NSManaged var entries: NSSet?
    @NSManaged var flavourTypes: NSOrderedSet?
    @NSManaged var journal: Journal?
    @NSManaged var servingTypes: NSOrderedSet?
    @NSManaged var statTypes: NSOrderedSet?

}
