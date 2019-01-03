//
//  Score.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 02/01/2019.
//  Copyright © 2019 Jens De Taey. All rights reserved.
//

import Foundation
struct Score : Decodable{
    var winner : String
    var fullTime : FullTime
    
    enum CodingKeys: String, CodingKey {
        case winner
        case fullTime
        
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.winner = try valueContainer.decode(String.self, forKey: CodingKeys.winner)
        self.fullTime = try valueContainer.decode(FullTime.self, forKey: CodingKeys.fullTime)
    }
}

struct FullTime : Decodable{
    var homeTeamScore : Int
    var awayTeamScore : Int
    
    enum CodingKeys: String, CodingKey {
        case homeTeamScore = "homeTeam"
        case awayTeamScore = "awayTeam"
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.homeTeamScore = try valueContainer.decode(Int.self, forKey: CodingKeys.homeTeamScore)
        self.awayTeamScore = try valueContainer.decode(Int.self, forKey: CodingKeys.awayTeamScore)
    }
}
