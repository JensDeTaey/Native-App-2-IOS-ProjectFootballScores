//
//  CompetitionCell.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 02/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import UIKit

class CompetitionCell : UITableViewCell {
    //@IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var competitionNameLabel: UILabel!
    var competiton: Competition! {
        didSet {
            competitionNameLabel.text = competiton.name;
            //nameLabel.text = project.name;
        }
    }
    
}
