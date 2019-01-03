//
//  MatchTableViewCell.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 31/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {

    
    
    
    @IBOutlet weak var HomeTeamLabel: UILabel!
    
    
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var AwayTeamLabel: UILabel!
    
    var match: Match! {
        didSet {
            HomeTeamLabel.text = match.homeTeam.name
            AwayTeamLabel.text = match.awayTeam.name
            ScoreLabel.text = String(match.score.fullTime.homeTeamScore) + "-" + String(match.score.fullTime.awayTeamScore) 
        }
    }

}
