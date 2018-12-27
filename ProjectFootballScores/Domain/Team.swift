//
//  Team.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 20/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import Foundation

struct Team : Codable
{
    var id: Int
    var name: String
    //var area: Area
    var address : String?
    var phone : String?
    var website : String?
    var email : String?
    var founded : Int?
    var crestUrl : URL?
    var clubColors : String?
    var players : Players?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case address
        case phone
        case website
        case email
        case founded
        case crestUrl
        case clubColors
        case players = "squad"
        //case area
    }
    
    init(id: Int, name: String,area: Area, address: String, phone: String, website: String, email: String, founded: Int,crestUrl:URL, clubColors: String, players : Players) {
        self.id = id
        self.name = name
        //self.area = area
        self.address = address
        self.phone = phone
        self.website = website
        self.email = email
        self.founded = founded
        self.crestUrl = crestUrl
        self.clubColors = clubColors
        //self.players = players
    }
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try valueContainer.decode(Int.self, forKey: CodingKeys.id)
        self.name = try valueContainer.decode(String.self, forKey: CodingKeys.name)
        //self.area = try valueContainer.decode(Area.self, forKey: CodingKeys.area)
        self.address = try? valueContainer.decode(String.self, forKey: CodingKeys.address)
        self.phone = try? valueContainer.decode(String.self, forKey: CodingKeys.phone)
        self.website = try? valueContainer.decode(String.self, forKey: CodingKeys.website)
        self.email = try? valueContainer.decode(String.self, forKey: CodingKeys.email)
        self.founded = try? valueContainer.decode(Int.self, forKey: CodingKeys.founded)
        self.crestUrl = try? valueContainer.decode(URL.self, forKey: CodingKeys.crestUrl)
        self.clubColors = try? valueContainer.decode(String.self, forKey: CodingKeys.clubColors)
        //self.players = try? valueContainer.decode(Players.self, forKey: CodingKeys.players)
    }
}

struct Teams  : Codable{
    let teams : [Team]
}

struct Area{
    let name: String
}
