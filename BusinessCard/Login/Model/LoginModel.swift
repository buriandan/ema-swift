import SwiftUI
import Foundation

struct LoginModel: Encodable {
    let username: String
    let password: String
    let timeToLive: Int = 3600
    
    enum CodingKeys: String, CodingKey {
        case username = "user_id"
        case password = "password"
        case timeToLive = "time-to-live"
    }
}

struct LoginResponse: Codable {
    let expiration: String
    let access_token: String
    
    enum CodingKeys: String, CodingKey {
        case expiration = "$expiration"
        case access_token = "access_token"
    }
}
