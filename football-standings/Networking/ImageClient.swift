//
//  ImageClient.swift
//  football-standings
//
//  Created by Rowan Rhodes on 05/02/2022.
//

import Foundation
import UIKit

protocol ImageClientService {
    func downloadImage<Request: DataRequest>(request: Request, completion: @escaping (UIImage?, Error?) -> Void)
    func setImage(from url: String, placeholderImage: UIImage?, completion: @escaping (UIImage?) -> Void)
}

final class ImageClient {
    
    //MARK: Static Properties
    static let shared: ImageClient = ImageClient(
        responseQueue: .main,
        session: URLSession.shared
    )
    
    // MARK: Public Properties
    let responseQueue: DispatchQueue?
    let session: URLSession
    
    // MARK: Private Properties
    private(set) var cachedImageForURL: [String: UIImage]
    private(set) var cachedTaskForImageView: [UIImageView : NetworkService]
    
    // MARK: Lifecycle
    init(responseQueue: DispatchQueue, session: URLSession) {
        self.responseQueue = responseQueue
        self.session = session
        self.cachedImageForURL = [:]
        self.cachedTaskForImageView = [:]
    }
    
    // MARK: Private Methods
    private func dispatchImage(
        image: UIImage? = nil,
        error: Error? = nil,
        completion: @escaping (UIImage?, Error?) -> Void) {
            guard let responseQueue = responseQueue else {
                completion(image, error)
                return
            }
            
            responseQueue.async {
                completion(image, error)
            }
        }
}

extension ImageClient: ImageClientService {
    
    func downloadImage<Request>(request: Request, completion: @escaping (UIImage?, Error?) -> Void) where Request : DataRequest {
        let service: NetworkService = NetworkService()
        
        service.request(request) { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let response):
                guard let image = response as? UIImage else {
                    return
                }
                
                self.dispatchImage(image: image, completion: completion)
            case .failure(let error):
                self.dispatchImage(error: error, completion: completion)
            }
        }
    }
    
    func setImage(from url: String, placeholderImage: UIImage?, completion: @escaping (UIImage?) -> Void) {
        let request = ImageRequest(url: url)
        if let cachedImage = cachedImageForURL[url] {
            completion(cachedImage)
        } else {
            downloadImage(request: request) { [weak self] image, error in
                guard let self = self else {
                    return
                }
                
                guard let image = image else {
                    return
                }
                
                self.cachedImageForURL[url] = image
                completion(self.cachedImageForURL[url])
            }
        }
    }
}

