//
//  MenuViewController.swift
//  Journal
//
//  Created by Sean Manley on 6/9/16.
//  Copyright © 2016 Sean Manley. All rights reserved.
//

import UIKit
import CoreData

class MenuViewController: UICollectionViewController {
    
    var entryTypes:[EntryType] = []
    var collectionViewSizeChanged:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchEntryTypes()
    }

    func fetchEntryTypes() {
        let appDelegate = (UIApplication.sharedApplication().delegate as? AppDelegate)
        let context = appDelegate?.managedObjectContext
        let request = NSFetchRequest(entityName: "EntryType")
        
        do {
            let results = try context?.executeFetchRequest(request)
            self.entryTypes = results as! [EntryType]
        } catch _ {
            
        }
        self.collectionView?.reloadData()
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.entryTypes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: TileCell = collectionView.dequeueReusableCellWithReuseIdentifier("TileCell", forIndexPath: indexPath) as! TileCell
        let entryType = self.entryTypes[indexPath.row]
        cell.configure(entryType)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as? AddJournalEntryViewController
        if let cell = sender as? TileCell {
            destination?.entryType = cell.entryType
        }
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        collectionViewSizeChanged = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if collectionViewSizeChanged {
            self.collectionView?.collectionViewLayout.invalidateLayout()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if collectionViewSizeChanged {
            collectionViewSizeChanged = false
            collectionView?.performBatchUpdates({ }, completion: nil)
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let size:CGFloat
        
        switch(traitCollection.userInterfaceIdiom) {
        case .Phone:
            size = collectionView.frame.size.width / (UIDevice.currentDevice().orientation.isPortrait ? 2.0 : 3.0)
            break
        case .Pad:
            size = collectionView.frame.size.width / (UIDevice.currentDevice().orientation.isPortrait ? 3.0 : 4.0)
            break
        default:
            size = 0.0
            break
        }
        return CGSize(width: size, height: size)
    }
}
