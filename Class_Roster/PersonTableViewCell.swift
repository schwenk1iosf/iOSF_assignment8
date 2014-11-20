//
//  PersonTableViewCell.swift
//  Class_Roster
//
//  Created by schwenk on 11/17/14.
//  Copyright (c) 2014 schwenk. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var personImageView: UIImageView!
    
    @IBOutlet weak var studentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
