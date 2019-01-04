//
//  CustomCell.swift
//  Elements
//
//  Created by Olimpia on 1/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var elementImage: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
