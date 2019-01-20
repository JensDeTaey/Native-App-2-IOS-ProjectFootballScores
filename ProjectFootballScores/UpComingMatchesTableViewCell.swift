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
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var awayTeamScore: UILabel!
    @IBOutlet weak var homeTeamScore: UILabel!
    var match: Match! {
        didSet {
            homeTeamLabel.text = match.homeTeam.name
            awayTeamLabel.text = match.awayTeam.name
            print(match.status)
            print(match.utcDate)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
            let date = dateFormatter.date(from: match.utcDate)
            let calendar = Calendar.current
            let comp = calendar.dateComponents([.day,.month,.hour, .minute], from: date!)
            let hour = comp.hour
            let minute = comp.minute
            if(match.status == "FINISHED"){
                awayTeamScore.isHidden = false
                homeTeamScore.isHidden = false
                awayTeamScore.text = String(match.score.fullTime.awayTeamScore!)
                homeTeamScore.text = String(match.score.fullTime.homeTeamScore!)
                dateLabel.text = String(comp.day!) + "/" +  String(comp.month!)
            }else{
                awayTeamScore.isHidden = true
                homeTeamScore.isHidden = true
                dateLabel.text = String(comp.day!) + "/" +  String(comp.month!) + " " +  String(hour!) + ":" + String(minute!)
               // middleLabel.text = "\(comp.day ?? 0)/\(comp.month ?? 0) \(hour ?? 00):\(minute ?? 00)"
            }
        }
    }

}
