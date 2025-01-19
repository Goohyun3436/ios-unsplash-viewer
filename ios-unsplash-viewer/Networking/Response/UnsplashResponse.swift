//
//  UnsplashResponse.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import Foundation

//MARK: - Photo
struct Photo: Decodable {
    let id: String
    let urls: Url
    let likes: Int
    let width: Int
    let height: Int
    let user: User
    var created_at: String
    
    var created_at_format: String {
        let inFormatter = DateFormatter()
        inFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        inFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        guard let date = inFormatter.date(from: created_at) else {
            return created_at
        }
        
        let outFormatter = DateFormatter()
        outFormatter.dateFormat = "yyyy년 M월 d일 게시됨"
        outFormatter.locale = Locale(identifier: "ko_KR")
        
        return outFormatter.string(from: date)
    }
}

struct Url: Decodable {
    let regular: String
}

struct User: Decodable {
    let name: String
    let profile_image: ProfileImage
}

struct ProfileImage: Decodable {
    let small: String
}

//MARK: - PhotosStatistics
struct PhotosStatistics: Decodable {
    let downloads: traffic
    let views: traffic
}

struct traffic: Decodable {
    let total: Int
}
