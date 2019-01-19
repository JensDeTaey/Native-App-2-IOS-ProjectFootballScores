//
//  Match.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 30/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import Foundation
//"utcDate":"2019-01-19T15:15:00Z","status":"SCHEDULED"

struct Match : Decodable{
    var competition: Competition
    var homeTeam : Team
    var awayTeam : Team
    var score : Score
    var status : String
    var utcDate : String
    
    enum CodingKeys: String, CodingKey {
        case competition
        case homeTeam
        case awayTeam
        case score
        case status
        case utcDate
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.competition = try valueContainer.decode(Competition.self, forKey: CodingKeys.competition)
        self.homeTeam = try valueContainer.decode(Team.self, forKey: CodingKeys.homeTeam)
        self.awayTeam = try valueContainer.decode(Team.self, forKey: CodingKeys.awayTeam)
        self.score = try valueContainer.decode(Score.self, forKey: CodingKeys.score)
        self.status = try valueContainer.decode(String.self, forKey: CodingKeys.status)
        self.utcDate = try valueContainer.decode(String.self, forKey: CodingKeys.utcDate)
    }
}

struct Matches : Decodable{
    let matches : [Match]
}
