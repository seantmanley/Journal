//
//  AppManager.swift
//  Journal
//
//  Created by Sean Manley on 6/9/16.
//  Copyright © 2016 Sean Manley. All rights reserved.
//

import UIKit
import CoreData

class AppManager: NSObject {
    static let sharedManager:AppManager = AppManager()
    let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    func initialize() {
        initializeJournal()
        do {
            try context.save()
        } catch _ { }
    }
    
    func initializeJournal() {
        let request = NSFetchRequest(entityName: "Journal")
        do {
            let results = try context.executeFetchRequest(request)
            if results.count == 0 {
                let journal = NSEntityDescription.insertNewObjectForEntityForName("Journal", inManagedObjectContext: context) as! Journal
                journal.name = "My Journal"
                
                initializeEntryTypes(journal)
            }
        } catch _ { }
    }
    
    func initializeEntryTypes(journal:Journal) {
        let request = NSFetchRequest(entityName: "EntryType")
        do {
            let results = try context.executeFetchRequest(request)
            if results.count == 0 {
                for item in [(name: "Beer", image: "icon_Beer"),(name: "Wine", image: "icon_Wine"),(name: "Cheese", image: "icon_Cheese"),(name: "Whiskey", image: "icon_Whiskey"),(name: "Cannabis", image: "icon_Cannabis")] {
                    let entryType = NSEntityDescription.insertNewObjectForEntityForName("EntryType", inManagedObjectContext: context) as! EntryType
                    entryType.name = item.name
                    entryType.journal = journal
                    entryType.imageName = item.image
                    
                    initializeOtherTypes(entryType)
                }
            }
        } catch _ { }
    }
    
    func initializeOtherTypes(entryType:EntryType) {
        let request = NSFetchRequest(entityName: "StatType")
        do {
            let results = try context.executeFetchRequest(request)
            if results.count == 0 {
                switch(entryType.name!) {
                    case "Beer":
                        for stat in ["IBU", "ABV", "Vintage", "Barrel"] {
                            let statType = NSEntityDescription.insertNewObjectForEntityForName("StatType", inManagedObjectContext: context) as! StatType
                            statType.name = stat
                            statType.entryType = entryType
                        }
                        for serving in ["Draft", "Bottle", "Cask", "Can", "Growler"] {
                            let servingType = NSEntityDescription.insertNewObjectForEntityForName("ServingType", inManagedObjectContext: context) as! ServingType
                            servingType.name = serving
                            servingType.entryType = entryType
                        }
                        for flavour in ["Alcohol", "Dark Fruit", "Citrus", "Hoppy", "Floral", "Spicy", "Herbal", "Malty", "Toffee", "Burnt", "Sweet", "Sour", "Bitter", "Dry", "Body", "Linger"] {
                            let flavourType = NSEntityDescription.insertNewObjectForEntityForName("FlavourType", inManagedObjectContext: context) as! FlavourType
                            flavourType.name = flavour
                            flavourType.entryType = entryType
                        }
                    break
                    case "Wine":
                        for stat in ["Vintage", "Region", "Brut", "Colour", "Barrel", "Cuvée"] {
                            let statType = NSEntityDescription.insertNewObjectForEntityForName("StatType", inManagedObjectContext: context) as! StatType
                            statType.name = stat
                            statType.entryType = entryType
                        }
                        for serving in ["Draft", "Bottle", "Cask", "Can", "Box"] {
                            let servingType = NSEntityDescription.insertNewObjectForEntityForName("ServingType", inManagedObjectContext: context) as! ServingType
                            servingType.name = serving
                            servingType.entryType = entryType
                        }
                        for flavour in ["Alcohol", "Dark Fruit", "Light Fruit", "Citrus", "Tannins", "Floral", "Spicy", "Herbal", "Earthy", "Must", "Woody", "Sweet", "Vegetal", "Mouth-Feel", "Nose", "Dry", "Body", "Linger"] {
                            let flavourType = NSEntityDescription.insertNewObjectForEntityForName("FlavourType", inManagedObjectContext: context) as! FlavourType
                            flavourType.name = flavour
                            flavourType.entryType = entryType
                        }
                    break
                    case "Cheese":
                        for stat in ["Source", "Region", "Style", "Age"] {
                            let statType = NSEntityDescription.insertNewObjectForEntityForName("StatType", inManagedObjectContext: context) as! StatType
                            statType.name = stat
                            statType.entryType = entryType
                        }
                        for serving in ["Paired", "Solo", "Fondue"] {
                            let servingType = NSEntityDescription.insertNewObjectForEntityForName("ServingType", inManagedObjectContext: context) as! ServingType
                            servingType.name = serving
                            servingType.entryType = entryType
                        }
                        for flavour in ["Dark Fruit", "Light Fruit", "Citrus", "Floral", "Spicy", "Herbal", "Earthy", "Must", "Woody", "Sweet", "Vegetal", "Soft", "Pungency", "Linger"] {
                            let flavourType = NSEntityDescription.insertNewObjectForEntityForName("FlavourType", inManagedObjectContext: context) as! FlavourType
                            flavourType.name = flavour
                            flavourType.entryType = entryType
                        }
                    break
                    case "Whiskey":
                        for stat in ["Region", "Style", "Vintage", "Barrel"] {
                            let statType = NSEntityDescription.insertNewObjectForEntityForName("StatType", inManagedObjectContext: context) as! StatType
                            statType.name = stat
                            statType.entryType = entryType
                        }
                        for serving in ["Mixed", "Rocks", "Neat", "Cold", "Warmed"] {
                            let servingType = NSEntityDescription.insertNewObjectForEntityForName("ServingType", inManagedObjectContext: context) as! ServingType
                            servingType.name = serving
                            servingType.entryType = entryType
                        }
                        for flavour in ["Dark Fruit", "Light Fruit", "Citrus", "Floral", "Spicy", "Herbal", "Earthy", "Must", "Woody", "Sweet", "Vegetal", "Burnt", "Peat", "Linger"] {
                            let flavourType = NSEntityDescription.insertNewObjectForEntityForName("FlavourType", inManagedObjectContext: context) as! FlavourType
                            flavourType.name = flavour
                            flavourType.entryType = entryType
                        }
                    break
                    case "Cannabis":
                        for stat in ["Region", "Style", "Lineage", "Legality", "THC", "CDL"] {
                            let statType = NSEntityDescription.insertNewObjectForEntityForName("StatType", inManagedObjectContext: context) as! StatType
                            statType.name = stat
                            statType.entryType = entryType
                        }
                        for serving in ["Bong", "Pipe", "Vaporizer", "Edible", "Joint", "Spliff"] {
                            let servingType = NSEntityDescription.insertNewObjectForEntityForName("ServingType", inManagedObjectContext: context) as! ServingType
                            servingType.name = serving
                            servingType.entryType = entryType
                        }
                        for flavour in ["Energized", "Focused", "High", "Lazy", "Sleepy", "Harsh", "Paranoia", "Hungry", "Duration", "Emotional", "Skunky", "Purity"] {
                            let flavourType = NSEntityDescription.insertNewObjectForEntityForName("FlavourType", inManagedObjectContext: context) as! FlavourType
                            flavourType.name = flavour
                            flavourType.entryType = entryType
                        }
                    break
                default: break
                }
            }
        } catch _ { }
    }
}
