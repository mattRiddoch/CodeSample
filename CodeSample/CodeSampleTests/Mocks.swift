//
//  Mocks.swift
//  CodeSampleTests
//
//  Created by Matthew Riddoch on 8/12/19.
//  Copyright © 2019 Matthew Riddoch. All rights reserved.
//

import Foundation
@testable import CodeSample

class Mocks {
    
    class RouterMock<EndPoint: EndpointType>: NetworkRouter {
        
        var data: Data?
        var response: URLResponse?
        var error: Error?
        
        func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
            completion(data, response, error)
        }
        
        func cancel() {
            //cancel task
        }
        
        
    }

}
