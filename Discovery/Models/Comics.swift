//
//  Comics.swift
//  Discovery
//
//  Created by Aiden on 2021/07/22.
//

struct Comics: Codable {
    var results: [Comic]
}

struct ResponseBody: Codable {
    var data: Comics
}
