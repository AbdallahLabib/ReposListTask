
import Foundation

struct Repo: Codable {
    let name: String?
    //let owner: Owner
    //let htmlURL: String
    
//    enum CodingKeys: String, CodingKey {
//        case name//, owner
//        //case htmlURL = "html_url"
//    }
}

struct Owner: Identifiable, Codable {
    let id: String
    let name: String
    let avatarURL: String
    let htmlURL: String
    let type: TypeEnum
    
    enum CodingKeys: String, CodingKey {
        case id = "node_id"
        case name, type
        case htmlURL = "html_url"
        case avatarURL = "avatar_url"
    }
}

enum TypeEnum: Codable {
    case organization
    case user
}
