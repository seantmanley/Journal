//
//  Flavour+CoreDataProperties.swift
//  Journal
//
//  Created by Sean Manley on 6/9/16.
//  Copyright © 2016 Sean Manley. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Flavour {

    @NSManaged var value: NSNumber?
    @NSManaged var entry: Entry?
    @NSManaged var flavour: NSSet?

}
