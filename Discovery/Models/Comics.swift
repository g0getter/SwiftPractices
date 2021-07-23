//
//  Comics.swift
//  Discovery
//
//  Created by Aiden on 2021/07/22.
//

struct Comics: Codable {
    var results: [Comic]
}

// TODO: API 늘어나도 하나로 쓰기 위해 제네릭으로
struct ResponseBody: Codable {
    var data: Comics
}
