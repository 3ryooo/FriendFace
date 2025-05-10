//
//  User.swift
//  FriendFace
//

import Foundation

struct User: Codable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let tags: [String]
    let friends: [Friend]
    struct Friend: Codable {
        let id: String
        let name: String
        
//        enum CodingKeys: String, CodingKey {
//            case _id = "id"
//            case _name = "name"
//        }
        
    }
    
//    enum CodingKeys: String, CodingKey {
//        case _id = "id"
//        case _isActive = "isActive"
//        case _name = "name"
//        case _age = "age"
//        case _company = "company"
//        case _email = "email"
//        case _address = "address"
//        case _about = "about"
//        case _tags = "tags"
//        case _friends = "friends"
//    }
    
    
}
