//
//  Route.swift
//  FCJsonModelParser
//
//  Created by Alejandro Barros Cuetos on 30/06/14.
//  Copyright (c) 2014 Alejandro Barros Cuetos. All rights reserved.
//

import Foundation

struct Route {
    let url : NSURL
    let method : RequestTypes
    let identifier : String
    
    init(url: NSURL, method: RequestTypes, identifier: String) {
        self.url = url
        self.method = method
        self.identifier = identifier
    }
}

func ==(route1: Route, route2: Route) -> Bool {
    return (route1.url == route2.url) && (route1.method == route2.method) && (route1.identifier == route2.identifier)
}

func !=(route1: Route, route2: Route) -> Bool {
    return !(route1 == route2)
}