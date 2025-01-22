//
//  UnsplashResponse.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import Foundation

//MARK: - Error
enum ResponseStatusUnsplash {
    case ok
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case server
    case unowned
    
    init(_ statusCode: Int?) {
        switch statusCode {
        case 200:
            self = .ok
        case 400:
            self = .badRequest
        case 401:
            self = .unauthorized
        case 403:
            self = .forbidden
        case 404:
            self = .notFound
        case 500, 503:
            self = .server
        default:
            self = .unowned
        }
    }
    
    var statusCode: String {
        switch self {
        case .ok:
            return "200"
        case .badRequest:
            return "400"
        case .unauthorized:
            return "401"
        case .forbidden:
            return "403"
        case .notFound:
            return "404"
        case .server:
            return "500, 503"
        case .unowned:
            return "0"
        }
    }
    
    var ko: String {
        switch self {
        case .ok:
            return ""
        case .badRequest:
            return "사진 가져오기에 실패했습니다."
        case .unauthorized:
            return "사용자를 찾을 수 없습니다."
        case .forbidden:
            return "접근 권한이 없습니다."
        case .notFound:
            return "사진 가져오기에 실패했습니다."
        case .server:
            return "Unsplash 서버에 문제가 생겼습니다."
        case .unowned:
            return "Unsplash 뷰어에 문제가 생겼습니다."
        }
    }
}

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

//MARK: - Search Photos
struct SearchPhotos: Decodable {
    let total: Int
    let total_pages: Int
    let results: [Photo]
}

//MARK: - PhotosStatistics
struct PhotosStatistics: Decodable {
    let downloads: traffic
    let views: traffic
}

struct traffic: Decodable {
    let total: Int
}
