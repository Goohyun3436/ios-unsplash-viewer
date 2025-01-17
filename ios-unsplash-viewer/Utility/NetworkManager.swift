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
    
    func unsplashTopicsPhotos(_ topicId: String, _ page: Int, _ perPage: Int, completionHandler: @escaping ([TopicsPhotos]) -> Void) {
        let url = APIUrl.unsplash + APIPathParamUnsplash.topicsPhotos.pathParam(topicId: topicId, page: page, perPage: perPage)
        
        let header: HTTPHeaders = [
            "Authorization": APIKey.unsplashAccess
        ]
        
        AF.request(url, method: .get, headers: header).responseDecodable(of: [TopicsPhotos].self) { response in
            
            switch response.result {
            case .success(let data):
                completionHandler(data)
                    
            case .failure(let err):
                print(err)
                    
            }
        }
        
    }
    
    func unsplashSearchPhotos() {}
    
    func unsplashPhotosStatistics() {}
    
}
