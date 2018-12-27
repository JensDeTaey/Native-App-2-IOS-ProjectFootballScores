//
//  Url.swift
//  ProjectFootballScores
//
//  Created by Jens De Taey on 01/12/2018.
//  Copyright © 2018 Jens De Taey. All rights reserved.
//

import Foundation
extension URL{
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self,resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap
            { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
