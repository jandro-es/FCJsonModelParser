//
//  FCNetworkManageTest.swift
//  FCJsonModelParser
//
//  Created by Alejandro Barros Cuetos on 30/06/14.
//  Copyright (c) 2014 Alejandro Barros Cuetos. All rights reserved.
//

import XCTest
import FCJsonModelParser

class NetworkManageTest: XCTestCase {
    
    func testSimpleSession() {
        let manager = NetworkManager()
        XCTAssert(manager.session != nil, "Session succesfully created")
    }
    
    func testBaseUrlSession() {
        
        let mockBaseUrl = NSURL.URLWithString("http://www.google.es")
        
        let manager = NetworkManager(baseUrl:  mockBaseUrl)
        XCTAssert(manager.session != nil, "Session succesfully created")
        
        if let baseUrl = manager.baseUrl {
            XCTAssert(baseUrl.isEqualTo(mockBaseUrl), "Base URL correctly set")
        } else {
            XCTAssert(false, "Base URL not properly set")
        }
    }
}
