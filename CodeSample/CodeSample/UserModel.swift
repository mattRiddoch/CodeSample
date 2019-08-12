//
//  UserModel.swift
//  CodeSample
//
//  Created by Matthew Riddoch on 8/9/19.
//  Copyright © 2019 Matthew Riddoch. All rights reserved.
//

import Foundation

struct UserApiResponse {
    //let page: Int
    let users: [User]
}

extension UserApiResponse: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        users = try container.decode([User].self)
    }
}


struct User {
    let fname: String
    let lname: String
    let city: String
}

extension User: Decodable {
    
    enum  UserCodingKeys: String, CodingKey {
        case fname = "fname"
        case lname = "lname"
        case city = "city"
    }
    
    init(from decoder: Decoder) throws {
        let userContainer = try decoder.container(keyedBy: UserCodingKeys.self)
        fname = try userContainer.decode(String.self, forKey: .fname)
        lname = try userContainer.decode(String.self, forKey: .lname)
        city = try userContainer.decode(String.self, forKey: .city)
    }
}
