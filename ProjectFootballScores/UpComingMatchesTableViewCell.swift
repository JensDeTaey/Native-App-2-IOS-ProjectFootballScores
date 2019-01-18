//
//  UpComingMatchesTableViewCell.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 18/01/2019.
//  Copyright © 2019 Jens De Taey. All rights reserved.
//

import UIKit

class UpComingMatchesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var middleLabel: UILabel!
    
    @IBOutlet weak var awayTeamLabel: UILabel!
    var status : String = ""
    var match: Match! {
        didSet {
            homeTeamLabel.text = match.homeTeam.name
            awayTeamLabel.text = match.awayTeam.name
            if(status == "Finished"){
                middleLabel.text = "\(match.score.fullTime.homeTeamScore ?? 0) -  \(match.score.fullTime.awayTeamScore ?? 0)"
            }else{
                
            }
        }
    }

}
