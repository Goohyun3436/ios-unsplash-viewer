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
    
    func unsplashTopicsPhotos() {
        let url = APIUrl.unsplash + "/topics/golden-hour/photos?page=1&per_page=1"
        
        let header: HTTPHeaders = [
            "Authorization": APIKey.unsplashAccess
        ]
        
        AF.request(url, method: .get, headers: header).responseDecodable(of: [TopicsPhotos].self) { response in
            
            switch response.result {
            case .success(let data):
                print(data)
                    
            case .failure(let err):
                print(err)
                    
            }
        }
        
    }
    
    func unsplashSearchPhotos() {}
    
    func unsplashPhotosStatistics() {}
    
}
