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
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try valueContainer.decode(Int.self, forKey: CodingKeys.id)
        self.name = try valueContainer.decode(String.self, forKey: CodingKeys.name)
    }
}
struct Competitions  : Codable{
    let competitions : [Competition]
}

