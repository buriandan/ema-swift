import SwiftUI

struct SkillModel: Codable {
    var skillType: String
    var value: Int
}

extension SkillModel: Identifiable {
  var id: UUID { return UUID() }
}
