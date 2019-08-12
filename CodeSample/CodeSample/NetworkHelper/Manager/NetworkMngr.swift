//
//  NetworkMngr.swift
//  CodeSample
//
//  Created by Matthew Riddoch on 8/9/19.
//  Copyright © 2019 Matthew Riddoch. All rights reserved.
//

import Foundation

var router = Router<UserApi>(session: URLSession.shared)

struct NetworkManager {
    
    //
    //pass session or mock!
    //let localsession = URLSession.shared
    
    
//    init() {
//        self.router = Router<UserApi>(session: URLSession.shared)
//    }
    
    enum NetworkResponse:String {
        case success
        case failed = "The request failed"
        case badRequest = "Bad Request"
        case noData = "Missing data"
    }
    
    enum Result<String>{
        case success
        case failure(String)
    }
    
    fileprivate func handleResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 400...499: return .failure(NetworkResponse.badRequest.rawValue)
        case 500...599: return .failure(NetworkResponse.failed.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
    
    
    func getAllUsers(completion: @escaping (_ users: [User]?, _ error: String?) -> ()){
        
        router.request(.allUsers) { data, response, error in
            
            if (error != nil) {
                //handle error
                completion(nil, "Check network connection")
            }
            
            if let response = response as? HTTPURLResponse {
                
                let result = self.handleResponse(response)
                
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {

                        let apiResponse = try JSONDecoder().decode(UserApiResponse.self, from: responseData)
                        print(responseData)
                        //let testResp = try JSONSerialization.jsonObject(with: responseData, options: [])
                        //print(testResp);
                        completion(apiResponse.users, nil)
                    } catch {
                        completion(nil, "Failed to decode")
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
        
    }
    
}


