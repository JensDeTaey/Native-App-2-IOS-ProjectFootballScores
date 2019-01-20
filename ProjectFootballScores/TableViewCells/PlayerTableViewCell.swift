//
//  PlayerTableViewCell.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 27/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var PlayerNameLabel: UILabel!
    @IBOutlet weak var PlayerNationalityLabel: UILabel!
    
    var player: Player! {
        didSet {
            PlayerNameLabel.text = player.name;
            PlayerNationalityLabel.text = player.nationality
        }
    }

}
