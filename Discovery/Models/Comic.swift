//
//  Comic.swift
//  Discovery
//
//  Created by Aiden on 2021/07/22.
//

// TODO: 'path' 말고 다른 이름으로 보낼 경우 처리
// TODO: path 형식 다를 경우
struct Thumbnail: Codable {
    var path: String
}

struct Comic: Codable {
    var title: String
    var thumbnail: Thumbnail
}

struct User: Codable {
//    var first_name: String
    var last_name: String
//    var country: String
}

struct ResponseBodyUser: Codable {
    var data: User
}
