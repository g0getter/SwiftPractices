//
//  Marvel.swift
//  Discovery
//
//  Created by 여나경 on 2021/06/10.
//
import Moya
import CryptoKit
import CommonCrypto

public enum Marvel {
    // 1
    static private let publicKey = "3c4dcb91653adab861890dee461e955f"
    static private let privateKey = "f0e43ec4a198e99634388c129739ca605ac217b9"

    // 2
    case comics

    case none

}

extension Marvel: TargetType {
    // 1
    public var baseURL: URL {
        return URL(string: "https://gateway.marvel.com/v1/public")!
//        return URL(string: "http://gateway.marvel.com/docs")!
//        return URL(string: "http://marvel.com")!
    }

    // 2
    public var path: String {
        switch self {
        case .comics: return "/comics"
        case .none: return ""
        }
    }

    // 3
    public var method: Moya.Method {
        switch self {
        case .comics: return .get
        case .none: return .get // Not post
        }
    }

    // 4
    public var sampleData: Data {
        return Data()
    }

    // 5
    public var task: Task {
        let ts = Date()
        let stringToHash: String = "\(ts)" + Marvel.privateKey + Marvel.publicKey
        let hash = Insecure.MD5.hash(data: stringToHash.data(using: .utf8)!)
        // TODO: 의미 알기
        let hashHex =  hash.map { String(format: "%02hhx", $0) }.joined()

        return .requestParameters(parameters: ["ts":ts, "apikey": Marvel.publicKey, "hash": hashHex], encoding: URLEncoding.queryString) // TODO
    }

    // 6
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }

    // 7
    public var validationType: ValidationType {
        return .successCodes
    }
}
