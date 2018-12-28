//
//  PlayerTableViewCell.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 27/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var PlayerNameLabel: UILabel!
    @IBOutlet weak var PlayerNationalityLabel: UILabel!
    var player: Player! {
        didSet {
            PlayerNameLabel.text = player.name;
            PlayerNationalityLabel.text = player.nationality
        }
    }

}
