//
//  Team.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 20/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class Team :  Object, Decodable
{
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    var area: Area?
    @objc dynamic var address : String?
    @objc dynamic var phone : String?
    @objc dynamic var website : String?
    @objc dynamic var email : String?
    var founded : RealmOptional<Int> = RealmOptional<Int>()
    var crestUrl : URL?
    @objc dynamic var clubColors : String?
    @objc dynamic var isFavorite : Bool = false
    
    var players : [Player]?
    
    // Initialisers needed for realm
    required init() {
        super.init()
    }
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
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
        case area
    }


    
  /*convenience init(id: Int, name: String,area: Area, address: String, phone: String, website: String, email: String, founded: Int,crestUrl:URL, clubColors: String, players : [Player]) {
        self.init()
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
        self.players = players
    }*/
     required init(from decoder: Decoder) throws {
       super.init()
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try valueContainer.decode(Int.self, forKey: CodingKeys.id)
        self.name = try valueContainer.decode(String.self, forKey: CodingKeys.name)
        self.area?.name = try valueContainer.decodeIfPresent(String.self, forKey: CodingKeys.area)
        self.address = try valueContainer.decodeIfPresent(String.self, forKey: CodingKeys.address)
        self.phone = try valueContainer.decodeIfPresent(String.self, forKey: CodingKeys.phone)
        self.website = try valueContainer.decodeIfPresent(String.self, forKey: CodingKeys.website)
        self.email = try valueContainer.decodeIfPresent(String.self, forKey: CodingKeys.email)
        
        self.crestUrl = try valueContainer.decodeIfPresent(URL.self, forKey: CodingKeys.crestUrl)
        self.clubColors = try valueContainer.decodeIfPresent(String.self, forKey: CodingKeys.clubColors)
        self.players = try valueContainer.decodeIfPresent([Player].self, forKey: CodingKeys.players)
        
        let founded = try valueContainer.decodeIfPresent(Int.self, forKey: CodingKeys.founded)
        if let founded = founded {
            self.founded.value = founded
        }
    }
    
}

struct Teams  : Decodable{
    let teams : [Team]
}

struct Area{
    var name: String?
}
