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
            print(date)
            print(hour)
            print(minute)
            if(match.status == "FINISHED"){
                middleLabel.text = "\(match.score.fullTime.homeTeamScore ?? 0) -  \(match.score.fullTime.awayTeamScore ?? 0)"
            }else{
                middleLabel.text = "\(comp.day ?? 0)/\(comp.month ?? 0) \(hour ?? 00):\(minute ?? 00)"
            }
        }
    }

}
