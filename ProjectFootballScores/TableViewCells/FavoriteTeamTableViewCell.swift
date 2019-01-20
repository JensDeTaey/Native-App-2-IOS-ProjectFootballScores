//
//  FavoriteTeamTableViewCell.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 20/01/2019.
//  Copyright © 2019 Jens De Taey. All rights reserved.
//

import UIKit

class FavoriteTeamTableViewCell: UITableViewCell {

    @IBOutlet weak var FavoriteTeamLabel: UILabel!
    var team: Team!{
        didSet{
            FavoriteTeamLabel.text = team.name
        }
    }

}
