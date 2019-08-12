//
//  NetworkRouter.swift
//  CodeSample
//
//  Created by Matthew Riddoch on 8/9/19.
//  Copyright © 2019 Matthew Riddoch. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()

protocol NetworkRouter: class {
    associatedtype EndPoint : EndpointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
