//
//  Entry+CoreDataProperties.swift
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

extension Entry {

    @NSManaged var dateAdded: NSDate?
    @NSManaged var dateModified: NSDate?
    @NSManaged var dateSampled: NSDate?
    @NSManaged var name: String?
    @NSManaged var notes: String?
    @NSManaged var price: NSDecimalNumber?
    @NSManaged var rating: NSNumber?
    @NSManaged var source: String?
    @NSManaged var entryType: EntryType?
    @NSManaged var flavourValues: NSSet?
    @NSManaged var journal: Journal?
    @NSManaged var statValues: NSOrderedSet?
    @NSManaged var servingValues: NSSet?

}
