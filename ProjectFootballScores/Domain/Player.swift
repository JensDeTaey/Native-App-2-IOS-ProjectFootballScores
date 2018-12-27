//
//  Player.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 26/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import Foundation

struct Player : Codable
{
    var id: Int
    var name: String
    //var area: Area
    var firstname : String?
    var lastname : String?
    var dateofBirth : String?
    var country : String?
    var nationality : String?
    var position : String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case firstname
        case lastname
        case dateofBirth
        case country = "countryOfBirth"
        case nationality
        case position
    }
    
    init(id: Int, name: String, firstname: String, lastname: String, dateofBirth: String, country: String, nationality: String,position: String) {
        self.id = id
        self.name = name
        self.firstname = firstname
        self.lastname = lastname
        self.dateofBirth = dateofBirth
        self.country = country
        self.nationality = nationality
        self.position = position
    }
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try valueContainer.decode(Int.self, forKey: CodingKeys.id)
        self.name = try valueContainer.decode(String.self, forKey: CodingKeys.name)
        
        self.firstname = try? valueContainer.decode(String.self, forKey: CodingKeys.firstname)
        self.lastname = try? valueContainer.decode(String.self, forKey: CodingKeys.lastname)
        self.dateofBirth = try? valueContainer.decode(String.self, forKey: CodingKeys.dateofBirth)
        self.country = try? valueContainer.decode(String.self, forKey: CodingKeys.country)
        self.nationality = try? valueContainer.decode(String.self, forKey: CodingKeys.nationality)
        self.position = try? valueContainer.decode(String.self, forKey: CodingKeys.position)
    }
    
}

struct Players  : Codable{
    let players : [Player]
}
