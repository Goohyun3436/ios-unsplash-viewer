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
    
    // Decodable 프로토콜을 준수하는 구조체의 타입 자체를 매개변수로 받으려면? -> 찾아보기
//    private func unsplashGet(_ url: String, _ responseT: Decodable.Type, completionHandler: @escaping (Decodable.Type) -> Void) {
//        let header: HTTPHeaders = [
//            "Authorization": APIKey.unsplashAccess
//        ]
//        
//        AF.request(url, method: .get, headers: header).responseDecodable(of: responseT.self) { response in
//            
//            switch response.result {
//                case .success(let data):
//                    completionHandler(data)
//                    
//                case .failure(let err):
//                    print(err)
//                    
//            }
//        }
//    }
    
    private let unsplashHeader: HTTPHeaders =  ["Authorization": APIKey.unsplashAccess]
    
    func unsplashTopicsPhotos(_ topic: Topic, _ page: Int, _ perPage: Int, completionHandler: @escaping ([Photo]) -> Void) {
        let url = APIUrl.unsplash + APIPathParamUnsplash.topicsPhotos.pathParam(topic: topic, page: page, perPage: perPage)
        
        AF.request(url, method: .get, headers: unsplashHeader).responseDecodable(of: [Photo].self) { response in
            
            switch response.result {
                case .success(let data):
                    completionHandler(data)
                    
                case .failure(let err):
                    print(err)
                    
            }
        }
    }
    
    func unsplashSearchPhotos(_ query: String, _ page: Int, _ perPage: Int, _ orderBy: OrderBy, _ color: ColorFilter?, completionHandler: @escaping (SearchPhotos) -> Void) {
        let url = APIUrl.unsplash + APIPathParamUnsplash.searchPhotos.pathParam(query: query, page: page, perPage: perPage, orderBy: orderBy, color: color)
        
        AF.request(url, method: .get, headers: unsplashHeader).responseDecodable(of: SearchPhotos.self) { response in
            
            switch response.result {
            case .success(let data):
                completionHandler(data)
                
            case .failure(let err):
                print(err)
                    
            }
        }
    }
    
    func unsplashPhotosStatistics(_ imageId: String, completionHandler: @escaping (PhotosStatistics) -> Void) {
        let url = APIUrl.unsplash + APIPathParamUnsplash.photosStatistics.pathParam(imageId: imageId)
        
        AF.request(url, method: .get, headers: unsplashHeader).responseDecodable(of: PhotosStatistics.self) { response in
            
            switch response.result {
                case .success(let data):
                    completionHandler(data)
                    
                case .failure(let err):
                    print(err)
                    
            }
        }
    }
}
