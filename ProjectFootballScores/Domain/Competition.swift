//
//  Competition.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 02/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import Foundation
struct Competition : Codable
{
    var id: Int
    //var area: Area
    var name: String
    //var code: Int?
    //var plan: String
    //var currentSeason: Season
    //var seasons: Season
    //var lastUpdated: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        //case currentSeason
        //case seasons
        //case lastUpdated
    }
    init(id:Int,name:String) {
        self.id = id
        self.name = name
    }
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try valueContainer.decode(Int.self, forKey: CodingKeys.id)
        self.name = try valueContainer.decode(String.self, forKey: CodingKeys.name)
        //self.currentSeason = try valueContainer.decode(Season.self, forKey: CodingKeys.currentSeason)
        //self.seasons = try valueContainer.decode(Int.self, forKey: CodingKeys.id)
        //self.lastUpdated = try valueContainer.decode(Date.self, forKey: CodingKeys.lastUpdated)
    }
}
struct Competitions  : Codable{
    let competitions : [Competition]
}



struct Season{
    var id:Int
    var startDate: Date
    var endDate: Date
    var currentMatchday: Int
}
