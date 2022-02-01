//
//  NetworkService.swift
//  football-standings
//
//  Created by Rowan Rhodes on 31/01/2022.
//

import Foundation

protocol NetworkServiceInterface {
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void)
}

final class NetworkService: NetworkServiceInterface {
    
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void) {
    
        guard var urlComponent = URLComponents(string: request.url) else {
            return completion(.failure(invalidEndpointError()))
        }
        
        urlComponent.queryItems = constructQueryItems(request.queryItems)
        
        guard let url = urlComponent.url else {
            return completion(.failure(invalidEndpointError()))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                return completion(.failure(NSError()))
            }
            
            guard let data = data else {
                return completion(.failure(NSError()))
            }
            
            do {
                try completion(.success(request.decode(data)))
            } catch let error as NSError {
                completion(.failure(error))
            }
        }
        .resume()
    }
    
    // MARK:- Private
    
    private func constructQueryItems(_ requestQueryItems: [String : String]) -> [URLQueryItem] {
        var queryItems: [URLQueryItem] = []
        
        requestQueryItems.forEach {
            let urlQueryItem = URLQueryItem(name: $0.key, value: $0.value)
            queryItems.append(urlQueryItem)
        }
        
        return queryItems
    }
    
    private func invalidEndpointError() -> NSError {
        return NSError(
            domain: ErrorResponse.invalidEndpoint.rawValue,
            code: 404,
            userInfo: nil
        )
    }

}
