//
//  Match.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 30/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import Foundation


struct Match : Decodable{
    var competition: Competition
    var homeTeam : Team
    var awayTeam : Team
    var score : Score
    
    enum CodingKeys: String, CodingKey {
        case competition
        case homeTeam
        case awayTeam
        case score
        
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.competition = try valueContainer.decode(Competition.self, forKey: CodingKeys.competition)
        self.homeTeam = try valueContainer.decode(Team.self, forKey: CodingKeys.homeTeam)
        self.awayTeam = try valueContainer.decode(Team.self, forKey: CodingKeys.awayTeam)
        self.score = try valueContainer.decode(Score.self, forKey: CodingKeys.score)
    }
}

struct Matches : Decodable{
    let matches : [Match]
}
