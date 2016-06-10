//
//  CheckBoxCell.swift
//  Journal
//
//  Created by Sean Manley on 6/9/16.
//  Copyright © 2016 Sean Manley. All rights reserved.
//

import UIKit

class CheckBoxCell: UITableViewCell {
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if !selected {
            self.imageView?.image = UIImage(named: "UncheckedBox")
        } else {
            self.imageView?.image = UIImage(named: "CheckedBox")
        }
    }
}
