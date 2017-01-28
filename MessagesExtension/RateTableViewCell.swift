//
//  RateTableViewCell.swift
//  BandC
//
//  Created by Ivan Trofimov on 22.01.17.
//  Copyright © 2017 Ivan Trofimov. All rights reserved.
//

import UIKit

class RateTableViewCell: UITableViewCell {

    
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var cows: UILabel!
    @IBOutlet weak var bulls: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
