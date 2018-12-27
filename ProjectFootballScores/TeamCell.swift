//
//  TeamCell.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 21/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import UIKit

class TeamCell : UITableViewCell {
   
    @IBOutlet weak var teamNameLabel: UILabel!
    var team: Team! {
        didSet {
            teamNameLabel.text = team.name;
            
        }
    }
}
