//
//  TopicsPhotos.swift
//  ios-unsplash-viewer
//
//  Created by Goo on 1/17/25.
//

import Foundation

//MARK: - TopicsPhotos
struct TopicsPhotos: Decodable {
    let id: String
    let urls: Url
    let likes: Int
}

struct Url: Decodable {
    let regular: String
}

//MARK: - PhotosStatistics
struct PhotosStatistics: Decodable {
    let downloads: traffic
    let views: traffic
}

struct traffic: Decodable {
    let total: Int
}

