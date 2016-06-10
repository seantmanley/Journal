//
//  TileCell.swift
//  Journal
//
//  Created by Sean Manley on 6/9/16.
//  Copyright © 2016 Sean Manley. All rights reserved.
//

import UIKit

class TileCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tileImage: UIImageView!
    
    var entryType: EntryType?
    
    func configure(entryType: EntryType) {
        self.titleLabel.text = entryType.name
        debugPrint(entryType.imageName!)
        self.tileImage.image = UIImage(named: entryType.imageName!)
        self.entryType = entryType
    }
}
