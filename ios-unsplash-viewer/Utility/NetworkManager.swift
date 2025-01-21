//
//  NetworkManager.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private let unsplashHeader: HTTPHeaders =  ["Authorization": APIKey.unsplashAccess]
    
    func unsplashGet<ResponseType: Decodable>(
        _ request: UnsplashRequest,
        _ responseT: ResponseType.Type,
        completionHandler: @escaping (ResponseType) -> Void
    ) {
        AF.request(request.endpoint, method: request.method, headers: request.header).responseDecodable(of: responseT) { response in
            
            switch response.result {
                case .success(let data):
                    completionHandler(data)
                    
                case .failure(let err):
                    print(err)
            }
        }
    }
}
