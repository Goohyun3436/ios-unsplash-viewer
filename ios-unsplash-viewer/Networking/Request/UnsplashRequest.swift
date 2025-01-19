//
//  UnsplashRequest.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/18/25.
//

import UIKit

enum Topic: String {
    case goldenHour = "golden-hour"
    case businessWork = "business-work"
    case architectureInterior = "architecture-interior"
    
    var ko: String {
        switch self {
        case .goldenHour:
            return "골든 아워"
        case .businessWork:
            return "비지니스 및 업무"
        case .architectureInterior:
            return "건축 및 인테리어"
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
