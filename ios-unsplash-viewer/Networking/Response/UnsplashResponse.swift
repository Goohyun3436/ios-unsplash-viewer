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
    let width: Int
    let height: Int
    let user: User
    let created_at: String
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

