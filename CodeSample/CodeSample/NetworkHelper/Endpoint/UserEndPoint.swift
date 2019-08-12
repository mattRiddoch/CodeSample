//
//  UserEndPoint.swift
//  CodeSample
//
//  Created by Matthew Riddoch on 8/9/19.
//  Copyright © 2019 Matthew Riddoch. All rights reserved.
//

import Foundation

public enum UserApi {
    case allUsers
    //case usersPage(page: Int)
}

extension UserApi: EndpointType {
    
    var baseURL: URL {
        guard let url = URL(string: "http://www.filltext.com/?") else { fatalError("baseUrl cannot be empty")}
        return url
    }
    
    var path: String {
        return "rows=100&fname={firstName}&lname={lastName}&city={city}&pretty=true"
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        return .request
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    
    
}
