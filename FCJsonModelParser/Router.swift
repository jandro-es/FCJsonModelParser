//
//  Router.swift
//  FCJsonModelParser
//
//  Created by Alejandro Barros Cuetos on 30/06/14.
//  Copyright (c) 2014 Alejandro Barros Cuetos. All rights reserved.
//

import Foundation

class Router {
    
    var routes : RoutesCollection?
    
    let baseUrl : NSURL
    let identifier : String
    
    init(baseUrl: NSURL, identifier: String,  routes: RoutesCollection?) {
        self.baseUrl = baseUrl
        self.identifier = identifier
        
        if let initRoutes = routes {
            self.routes = routes
        } else {
            self.routes = RoutesCollection(routeCollection: nil)
        }
    }
    
    /*func requestForIdentifier(identifier: String, parameters: String[]?) -> NSURLRequest {
        
    }*/
    
    func addRoute(route: Route) {
        self.routes?.addRoute(route)
    }
    
    func addRoutes(routes: Route[]) {
        self.routes?.addRoutes(routes)
    }
    
    func numberOfRoutes() -> Int {
        return self.routes!.numberOfRoutes()
    }
}

func ==(router1: Router, router2: Router) -> Bool {
    
    let routes1 = router1.routes!
    let routes2 = router2.routes!
    
    return (routes1 == routes2) && (router1.baseUrl == router2.baseUrl) && (router1.identifier == router2.identifier)
}

func !=(router1: Router, router2: Router) -> Bool {
    return !(router1 == router2)
}