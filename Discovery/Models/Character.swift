//
//  Character.swift
//  Discovery
//
//  Created by 여나경 on 2021/06/22.
//

import Foundation
import UIKit

/// Marvel Character
struct Character: Codable {
    var offset: Int
    var code: Int
    var name: String
//    var image: UIImage

    private enum CodingKeys: String, CodingKey {
        case offset = "data"
        case name
        case code = "id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        offset = try values.decode(Int.self, forKey: .offset)
        code = try values.decode(Int.self, forKey: .code)
        name = try values.decode(String.self, forKey: .name)
    }
}
