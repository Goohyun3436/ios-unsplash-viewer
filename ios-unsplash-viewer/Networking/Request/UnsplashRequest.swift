//
//  UnsplashRequest.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/18/25.
//

import UIKit
import Alamofire

enum UnsplashRequest {
    case topicsPhotos(_ topic: Topic,
                      _ page: Int,
                      _ perPage: Int)
    case searchPhotos(_ query: String,
                      _ page: Int,
                      _ perPage: Int,
                      _ orderBy: OrderBy,
                      _ color: ColorFilter?)
    case photosStatistics(_ imageId: String)
    
    var endpoint: String {
        return APIUrl.unsplash + self.path
    }
    
    var path: String {
        switch self {
        case .topicsPhotos(let topic, _, _):
            return "/topics/\(topic.rawValue)/photos"
        case .searchPhotos:
            return "/search/photos"
        case .photosStatistics(let imageId):
            return "/photos/\(imageId)/statistics"
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .topicsPhotos(_, let page, let perPage):
            return [
                "page": page,
                "per_page": perPage
            ]
        case .searchPhotos(let query, let page, let perPage, let orderBy, let color):
            var query = [
                "query": query,
                "page": "\(page)",
                "per_page": "\(perPage)",
                "order_by": orderBy.rawValue
            ]
            query["color"] = color?.rawValue
            return query
        case .photosStatistics:
            return [:]
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var header: HTTPHeaders {
        return ["Authorization": APIKey.unsplashAccess]
    }
    
    var responsType: Decodable.Type {
        switch self {
        case .topicsPhotos:
            return [Photo].self
        case .searchPhotos:
            return SearchPhotos.self
        case .photosStatistics:
            return PhotosStatistics.self
        }
    }
}

enum Topic: String, CaseIterable {
    case architectureInterior = "architecture-interior"
    case goldenHour = "golden-hour"
    case wallpapers = "wallpapers"
    case nature = "nature"
    case threeDRenders  = "3d-renders"
    case travel  = "travel"
    case texturesPatterns  = "textures-patterns"
    case streetPhotography  = "street-photography"
    case film  = "film"
    case archival  = "archival"
    case experimental  = "experimental"
    case animals  = "animals"
    case fashionBeauty  = "fashion-beauty"
    case people  = "people"
    case businessWork = "business-work"
    case foodDrink  = "food-drink"
    
    var ko: String {
        switch self {
        case .architectureInterior:
            return "건축 및 인테리어"
        case .goldenHour:
            return "골든 아워"
        case .wallpapers:
            return "배경 화면"
        case .nature:
            return "자연"
        case .threeDRenders:
            return "3D 렌더링"
        case .travel:
            return "여행하다"
        case .texturesPatterns:
            return "텍스처 및 패턴"
        case .streetPhotography:
            return "거리 사진"
        case .film:
            return "필름"
        case .archival:
            return "기록의"
        case .experimental:
            return "실험적인"
        case .animals:
            return "동물"
        case .fashionBeauty:
            return "패션 및 뷰티"
        case .people:
            return "사람"
        case .businessWork:
            return "비지니스 및 업무"
        case .foodDrink:
            return "식음료"
        }
    }
}

enum OrderBy: String {
    case relevant, latest
    
    var ko: String {
        switch self {
        case .relevant:
            return "관련순"
        case .latest:
            return "최신순"
        }
    }
    
    func toggle() -> OrderBy {
        switch self {
        case .relevant:
            return OrderBy.latest
        case .latest:
            return OrderBy.relevant
        }
    }
}

enum ColorFilter: String, CaseIterable {
    case black , white , yellow , red , purple , green , blue
    
    var ko: String {
        switch self {
        case .black:
            return "블랙"
        case .white:
            return "화이트"
        case .yellow:
            return "옐로우"
        case .red:
            return "레드"
        case .purple:
            return "퍼플"
        case .green:
            return "그린"
        case .blue:
            return "블루"
        }
    }
    
    var color: UIColor {
        switch self {
        case .black:
            return UIColor.black
        case .white:
            return UIColor.white
        case .yellow:
            return UIColor.systemYellow
        case .red:
            return UIColor.systemRed
        case .purple:
            return UIColor.systemPurple
        case .green:
            return UIColor.systemGreen
        case .blue:
            return UIColor.systemBlue
        }
    }
}
