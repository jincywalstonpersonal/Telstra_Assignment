//
//  Telstra_AssignmentTests.swift
//  Telstra_AssignmentTests
//
//  Created by mac_admin on 1/21/19.
//  Copyright © 2019 mac_admin. All rights reserved.
//

import XCTest

@testable import Telstra_Assignment

class Telstra_AssignmentTests: XCTestCase {
var vcController: ViewController?
var sessionUnderTest: URLSession!

    override func setUp() {
        super.setUp()
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
        // Put setup code here. This method is called before the invocation of each test method in the class.
}

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sessionUnderTest = nil
        super.tearDown()
        
    }
    
    func testViewDidLoad(){
        XCTAssert(vcController?.viewDidLoad() == nil, "CollectionView Loaded")
    }

    // Asynchronous test: success fast, failure slow
    func testValidCallToGetsHTTPStatusCode200() {
        // given
        let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")
        // 1
        let promise = expectation(description: "Status code: 200")
        
        // when
        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
            // then
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        // 3
        waitForExpectations(timeout: 60, handler: nil)
    }
}
