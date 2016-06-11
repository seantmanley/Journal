//
//  AddJournalEntry.swift
//  Journal
//
//  Created by Sean Manley on 6/9/16.
//  Copyright © 2016 Sean Manley. All rights reserved.
//

import UIKit
import CoreData

class AddJournalEntryViewController: UIViewController {
    
    @IBOutlet weak var radarView: RadarChart!
    
    var entryType:EntryType? {
        didSet {
            if let name = entryType?.name {
                self.title = "New \(name) Entry"
            }
        }
    }
    var flavourTypes:[FlavourType]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buildFlavourRadar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func savePressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func buildFlavourRadar() {
        flavourTypes = entryType?.flavourTypes?.array as! [FlavourType]
        
        let radar = RadarChart(frame: radarView.frame)
        radarView.addSubview(radar)
        radar.animateDraw(1.0)
    }
}
