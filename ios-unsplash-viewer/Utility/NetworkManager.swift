//
//  NetworkManager.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func unsplashGet<ResponseType: Decodable>(
        _ request: UnsplashRequest,
        _ responseT: ResponseType.Type,
        completionHandler: @escaping (ResponseType) -> Void,
        failHandler: @escaping (ResponseStatusUnsplash) -> Void
    ) {
        AF.request(
            request.endpoint,
            method: request.method,
            parameters: request.parameters,
            headers: request.header
        ).responseDecodable(of: responseT) { response in
            switch response.result {
            case .success(let data):
                completionHandler(data)
                    
            case .failure(_):
                failHandler(ResponseStatusUnsplash(response.response?.statusCode ?? 0))
            }
        }
    }
}
