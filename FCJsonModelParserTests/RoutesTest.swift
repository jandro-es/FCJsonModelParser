//
//  RoutesTest.swift
//  FCJsonModelParser
//
//  Created by Alejandro Barros Cuetos on 30/06/14.
//  Copyright (c) 2014 Alejandro Barros Cuetos. All rights reserved.
//

import XCTest
import FCJsonModelParser

class RoutesTest: XCTestCase {
    
    func testRoute() {
        let route = Route(url: NSURL.URLWithString("http://www.google.es"), method: RequestTypes.GET, identifier: "Test route")
        XCTAssert((route.identifier == "Test route") && (route.url == NSURL.URLWithString("http://www.google.es")) && (route.method == RequestTypes.GET), "Session succesfully created")
        
        let route1 = Route(url: NSURL.URLWithString("http://www.google.es"), method: RequestTypes.GET, identifier: "Test route")
        let route2 = Route(url: NSURL.URLWithString("http://www.google.es"), method: RequestTypes.GET, identifier: "Test route")
        let route3 = Route(url: NSURL.URLWithString("http://www.google.com"), method: RequestTypes.GET, identifier: "Test route")
        
        XCTAssert(route1 == route2, "Equality operand worked correctly")
        XCTAssert(route1 != route3, "Inequality operand worked correctly")
    }
    
    func testRoutesCollection() {
        let route1 = Route(url: NSURL.URLWithString("http://www.google.es"), method: RequestTypes.GET, identifier: "Test route GET")
        let route2 = Route(url: NSURL.URLWithString("http://www.google.com"), method: RequestTypes.POST, identifier: "Test route POST")
        let route3 = Route(url: NSURL.URLWithString("http://www.google.fr"), method: RequestTypes.HEAD, identifier: "Test route HEAD")
        let route4 = Route(url: NSURL.URLWithString("http://www.google.co.uk"), method: RequestTypes.PUT, identifier: "Test route PUT")
        let route5 = Route(url: NSURL.URLWithString("http://www.random.com"), method: RequestTypes.PUT, identifier: "Test route")
        
        var collection1 = RoutesCollection(routeCollection: nil)
        
        collection1.addRoute(route1)
        collection1.addRoute(route2)
        collection1.addRoute(route3)
        collection1.addRoute(route4)
        
        XCTAssert(collection1.numberOfRoutes() == 4, ".numberOfRoutes() correct")
        XCTAssert(collection1.containsRoute(route2), ".containsRoute(route) correct")
        XCTAssert(collection1.routeAtIndex(2) == route3, ".routeAtIndex(index) correct")
        
        var collection2 = RoutesCollection(routeCollection: [route1, route2, route3, route4])
        
        XCTAssert(collection2.numberOfRoutes() == 4, ".numberOfRoutes() correct")
        XCTAssert(collection2.containsRoute(route2), ".containsRoute(route) correct")
        XCTAssert(collection2.routeAtIndex(2) == route3, ".routeAtIndex(index) correct")
        
        var collection3 = RoutesCollection(routeCollection: [route1, route2, route3, route5])
        var collection4 = RoutesCollection(routeCollection: [route1, route2, route4])
        
        XCTAssert(collection1 == collection2, "Equality operand worked correctly")
        XCTAssert(collection1 != collection3, "Inequality operand worked correctly")
        XCTAssert(collection1 != collection4, "Inequality operand worked correctly")
        XCTAssert(collection3 != collection4, "Inequality operand worked correctly")
    }
}
