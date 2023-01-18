import SwiftUI

struct HomeworkModel: Decodable, Identifiable {
    let state: HomeworkState
    let number: Int
    let id: Int
}

enum HomeworkState: String, Decodable {
    case comingsoon
    case push
    case review
    case acceptance
    case ready
}
