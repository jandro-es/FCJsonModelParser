//
//  RoutesCollection.swift
//  FCJsonModelParser
//
//  Created by Alejandro Barros Cuetos on 30/06/14.
//  Copyright (c) 2014 Alejandro Barros Cuetos. All rights reserved.
//

import Foundation

class RoutesCollection {
    
    var routes : Route[]
    
    init(routeCollection: Route[]?) {
        self.routes = Route[]()
        
        if let routes = routeCollection {
            for route in routes {
                self.addRoute(route)
            }
        }
    }
    
    func addRoute(route: Route) {
        self.routes.append(route)
    }
    
    func addRoutes(routes: Route[]) {
        for route in routes {
            if !self.containsRoute(route) {
                self.addRoute(route)
            }
        }
    }
    
    func numberOfRoutes() -> Int {
        return self.routes.count
    }
    
    func routeAtIndex(index: Int) -> Route {
        return self.routes[index]
    }
    
    func containsRoute(route: Route) -> Bool {
        for existenRoute in self.routes {
            if existenRoute == route {
                return true
            }
        }
        
        return false
    }
    
    func findRoute(route: Route) -> (Route, Int)? {
        for (index, existentRoute) in enumerate(self.routes) {
            if existentRoute == route {
                print(existentRoute.identifier)
                return (existentRoute, index)
            }
        }
        
        return nil
    }
    
    func clearRoutes() {
        self.routes = Route[]()
    }
    
    func removeRouteAtIndex(index: Int) {
        self.routes.removeAtIndex(index)
    }
    
    func dropRoute(route: Route) -> Route? {
        if let routeData = self.findRoute(route) {
            self.removeRouteAtIndex(routeData.1)
            return routeData.0
        }
        
        return nil
    }
}

func ==(collection1: RoutesCollection, collection2: RoutesCollection) -> Bool {
    
    if collection1.numberOfRoutes() != collection2.numberOfRoutes() {
        return false
    }
    
    for (index, route) in enumerate(collection1.routes) {
        if route != collection2.routeAtIndex(index) {
            return false
        }
    }
    
    return true
}

func !=(collection1: RoutesCollection, collection2: RoutesCollection) -> Bool {
    return !(collection1 == collection2)
}