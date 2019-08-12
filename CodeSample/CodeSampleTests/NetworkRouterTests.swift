//
//  NetworkRouterTests.swift
//  CodeSampleTests
//
//  Created by Matthew Riddoch on 8/12/19.
//  Copyright © 2019 Matthew Riddoch. All rights reserved.
//

import XCTest
@testable import CodeSample

class NetworkRouterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //var router = Router<UserApi>(session: URLSession.shared)
        //var testsession =
        let testrouter = Mocks.RouterMock<UserApi>()
        var data: Data?
        var response: URLResponse?
        var error: Error?
        //var result: UrlRe?
        testrouter.request(UserApi.allUsers) { (data, response, error) in
            //return $0
            print("test!")
        }
        
        XCTAssertEqual(true, false)
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
