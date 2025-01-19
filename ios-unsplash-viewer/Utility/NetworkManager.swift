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
    
    func unsplashTopicsPhotos(_ topic: Topic, _ page: Int, _ perPage: Int, completionHandler: @escaping ([Photo]) -> Void) {
        let url = APIUrl.unsplash + APIPathParamUnsplash.topicsPhotos.pathParam(topic: topic, page: page, perPage: perPage)
        
        let header: HTTPHeaders = [
            "Authorization": APIKey.unsplashAccess
        ]
        
        AF.request(url, method: .get, headers: header).responseDecodable(of: [Photo].self) { response in
            
            switch response.result {
                case .success(let data):
                    completionHandler(data)
                    
                case .failure(let err):
                    print(err)
                    
            }
        }
    }
    
    func unsplashSearchPhotos(_ query: String, _ page: Int, _ perPage: Int, orderBy: OrderBy) {
        let url = APIUrl.unsplash + APIPathParamUnsplash.searchPhotos.pathParam(query: query, page: page, perPage: perPage, orderBy: orderBy)
        
        let header: HTTPHeaders = [
            "Authorization": APIKey.unsplashAccess
        ]
        
        AF.request(url, method: .get, headers: header).responseString { res in
            print(res)
        }
        
        //            .responseDecodable(of: PhotosStatistics.self) { response in
        //
        //            switch response.result {
        //            case .success(let data):
        //                completionHandler(data)
        //
        //            case .failure(let err):
        //                print(err)
        //
        //            }
        //        }
    }
    
    func unsplashPhotosStatistics(_ imageId: String, completionHandler: @escaping (PhotosStatistics) -> Void) {
        let url = APIUrl.unsplash + APIPathParamUnsplash.photosStatistics.pathParam(imageId: imageId)
        
        let header: HTTPHeaders = [
            "Authorization": APIKey.unsplashAccess
        ]
        
        AF.request(url, method: .get, headers: header).responseDecodable(of: PhotosStatistics.self) { response in
            
            switch response.result {
                case .success(let data):
                    completionHandler(data)
                    
                case .failure(let err):
                    print(err)
                    
            }
        }
    }
}
