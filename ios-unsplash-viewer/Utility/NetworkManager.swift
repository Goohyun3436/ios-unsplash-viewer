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
    
    private func unsplashGet<ResponseType: Decodable>(_ url: String,  _ responseT: ResponseType.Type, completionHandler: @escaping (ResponseType) -> Void) {
        
        AF.request(url, method: .get, headers: unsplashHeader).responseDecodable(of: responseT) { response in
            
            switch response.result {
                case .success(let data):
                    completionHandler(data)
                    
                case .failure(let err):
                    print(err)
                    
            }
        }
    }
    
    func unsplashTopicsPhotos(_ topic: Topic,
                              _ page: Int,
                              _ perPage: Int,
                              completionHandler: @escaping ([Photo]) -> Void) {
        let url = APIUrl.unsplash + APIPathParamUnsplash.topicsPhotos.pathParam(topic: topic, page: page, perPage: perPage)
        unsplashGet(url, [Photo].self, completionHandler: completionHandler)
    }
    
    func unsplashSearchPhotos(_ query: String,
                              _ page: Int,
                              _ perPage: Int,
                              _ orderBy: OrderBy,
                              _ color: ColorFilter?,
                              completionHandler: @escaping (SearchPhotos) -> Void) {
        let url = APIUrl.unsplash + APIPathParamUnsplash.searchPhotos.pathParam(query: query, page: page, perPage: perPage, orderBy: orderBy, color: color)
        unsplashGet(url, SearchPhotos.self, completionHandler: completionHandler)
    }
    
    func unsplashPhotosStatistics(_ imageId: String,
                                  completionHandler: @escaping (PhotosStatistics) -> Void) {
        let url = APIUrl.unsplash + APIPathParamUnsplash.photosStatistics.pathParam(imageId: imageId)
        unsplashGet(url, PhotosStatistics.self, completionHandler: completionHandler)
    }
}
