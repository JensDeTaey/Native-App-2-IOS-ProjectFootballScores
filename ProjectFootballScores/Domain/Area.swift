//
//  Area.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 20/01/2019.
//  Copyright © 2019 Jens De Taey. All rights reserved.
//

import Foundation
struct Area : Decodable{
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case name
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try valueContainer.decode(String.self, forKey: CodingKeys.name)
    }
}
