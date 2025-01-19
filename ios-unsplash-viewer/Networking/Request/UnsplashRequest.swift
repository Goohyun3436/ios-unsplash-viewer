//
//  UnsplashRequest.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/18/25.
//

import Foundation

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
}
