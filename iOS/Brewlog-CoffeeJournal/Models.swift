import Foundation

struct Brew: Identifiable, Codable, Equatable {
    let id: UUID
    var bean: String
    var origin: String
    var method: String
    var rating: Int
    var createdAt: Date

    init(id: UUID = UUID(), bean: String = "", origin: String = "", method: String = "", rating: Int = 0, createdAt: Date = Date()) {
        self.id = id
        self.bean = bean
        self.origin = origin
        self.method = method
        self.rating = rating
        self.createdAt = createdAt
    }
}
