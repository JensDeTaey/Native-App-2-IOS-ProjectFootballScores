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
     required init(from decoder: Decoder) throws {
       super.init()
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try valueContainer.decode(Int.self, forKey: CodingKeys.id)
        self.name = try valueContainer.decode(String.self, forKey: CodingKeys.name)
        self.area = try? valueContainer.decode(Area.self, forKey: CodingKeys.area)
        self.address = try? valueContainer.decode(String.self, forKey: CodingKeys.address)
        self.phone = try? valueContainer.decode(String.self, forKey: CodingKeys.phone)
        self.website = try? valueContainer.decode(String.self, forKey: CodingKeys.website)
        self.email = try? valueContainer.decode(String.self, forKey: CodingKeys.email)
        self.crestUrl = try? valueContainer.decode(URL.self, forKey: CodingKeys.crestUrl)
        self.clubColors = try? valueContainer.decode(String.self, forKey: CodingKeys.clubColors)
        self.players = try? valueContainer.decode([Player].self, forKey: CodingKeys.players)
        let founded = try? valueContainer.decode(Int.self, forKey: CodingKeys.founded)
        if let founded = founded {
            self.founded.value = founded
        }
    }
    
}

struct Teams  : Decodable{
    let teams : [Team]
}

//copy for working with realm
extension Team:NSCopying{
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Team()
        copy.id = self.id
        copy.name = self.name
        copy.area = self.area
        copy.address = self.address
        copy.website = self.website
        copy.phone = self.phone
        copy.clubColors = self.clubColors
        copy.crestUrl = self.crestUrl
        copy.email = self.email
        copy.founded = RealmOptional(self.founded.value)
        return copy
    }
}
