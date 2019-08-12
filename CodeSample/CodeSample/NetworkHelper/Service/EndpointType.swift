//
//  EndpointType.swift
//  CodeSample
//
//  Created by Matthew Riddoch on 8/9/19.
//  Copyright © 2019 Matthew Riddoch. All rights reserved.
//

import Foundation

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
