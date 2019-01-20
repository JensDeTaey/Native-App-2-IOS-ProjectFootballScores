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
    @IBOutlet weak var AwayTeamScoreLabel: UILabel!
    @IBOutlet weak var HomeTeamScoreLabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var AwayTeamLabel: UILabel!
    
    var match: Match! {
        didSet {
            HomeTeamLabel.text = match.homeTeam.name
            AwayTeamLabel.text = match.awayTeam.name
            HomeTeamScoreLabel.text = String(match.score.fullTime.homeTeamScore ?? 0)
            AwayTeamScoreLabel.text = String(match.score.fullTime.awayTeamScore ?? 0)
            
            //set the date in string to a date datatype
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
            let date = dateFormatter.date(from: match.utcDate)
            let calendar = Calendar.current
            let comp = calendar.dateComponents([.hour, .minute], from: date!)
            TimeLabel.text = String(format: "%02d:%02d", comp.hour!, comp.minute!)
        }
    }

}
