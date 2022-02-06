//
//  FootballStandingsRequest.swift
//  football-standings
//
//  Created by Rowan Rhodes on 31/01/2022.
//

import Foundation

struct FootballStandingsRequest: DataRequest {
    
    var url: String {
        let baseURL: String = "https://api-football-standings.azharimm.site/"
        let path: String = "/leagues/eng.1/standings"
        return baseURL + path
    }
    
    var headers: [String : String] {
        [:]
    }
    
    var queryItems: [String : String] {
        [
            "season": "2021",
            "sort": "asc"
        ]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    func decode(_ data: Data) throws -> League {
        let jsonDecoder = JSONDecoder()
        let response = try jsonDecoder.decode(ApiResponse.self, from: data)
        return response.league
    }
}
