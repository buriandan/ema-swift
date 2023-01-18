struct StudentModel: Identifiable, Decodable {
    let id: String
    let name: String
    let participantType: String
    let title: String
    let icon512: String
    let icon192: String
    let icon72: String
    let skills: [SkillModel]?
    let homework: [HomeworkModel]
}
