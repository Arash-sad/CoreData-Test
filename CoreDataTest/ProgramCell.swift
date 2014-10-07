//
//  ProgramCell.swift
//  CoreDataTest
//
//  Created by Arash Sadeghieh E on 7/10/2014.
//  Copyright (c) 2014 Arash Sadeghieh Eshtehadi. All rights reserved.
//

import UIKit

class ProgramCell: UITableViewCell {

    @IBOutlet weak var cellNameLabel: UILabel!
    @IBOutlet weak var cellSetLabel: UILabel!
    @IBOutlet weak var cellRepLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
