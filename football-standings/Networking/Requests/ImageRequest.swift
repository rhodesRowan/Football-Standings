//
//  ImageRequest.swift
//  football-standings
//
//  Created by Rowan Rhodes on 05/02/2022.
//

import Foundation
import UIKit

class ImageRequest : DataRequest {
    
    var url: String
    
    init(url: String) {
        self.url = url
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var headers: [String : String] {
        [:]
    }
    
    var queryItems: [String : String] {
        [:]
    }
    
    func decode(_ data: Data) throws -> UIImage {
        guard let image = UIImage(data: data) else {
            throw NSError(
                domain: ErrorResponse.invalidResponse.rawValue,
                code: 13,
                userInfo: nil
            )
        }
        
        return image
    }
}
