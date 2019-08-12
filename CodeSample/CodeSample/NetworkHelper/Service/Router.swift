//
//  Router.swift
//  CodeSample
//
//  Created by Matthew Riddoch on 8/9/19.
//  Copyright © 2019 Matthew Riddoch. All rights reserved.
//

import Foundation

class Router<EndPoint: EndpointType>: NetworkRouter {
    
    private var task: URLSessionTask?
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        
         //let session = URLSession.shared
        
        do {
            let request = try self.buildRequest(from: route)
            //mock here??
            task = session.dataTask(with: request, completionHandler: { data, response, error in completion(data, response, error) } )
        } catch {
            completion(nil, nil, error)
        }
        
        self.task?.resume()
        
    }
    
    fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {
        
        var urlCompoents = URLComponents(url: route.baseURL, resolvingAgainstBaseURL: true)
        urlCompoents?.query = route.path
        var request = URLRequest(url: (urlCompoents?.url)!,
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 15.0)
        request.httpMethod = route.httpMethod.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return request
        
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
}
