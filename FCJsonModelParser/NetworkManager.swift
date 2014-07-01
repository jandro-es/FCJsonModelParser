//
//  FCNetworkManager.swift
//  FCJsonModelParser
//
//  Created by Alejandro Barros Cuetos on 30/06/14.
//  Copyright (c) 2014 Alejandro Barros Cuetos. All rights reserved.
//

import Foundation

enum RequestTypes {
    case POST, PUT, DELETE, GET, HEAD
}

class NetworkManager: NSObject {
    
    var session : NSURLSession
    var delegate : NetworkProtocol?
    
    let baseUrl : NSURL?

    convenience init() {
        self.init(baseUrl : nil)
    }
    
    init(baseUrl : NSURL?)
    {
        if let bUrl = baseUrl {
            self.baseUrl = bUrl
        }
        
        self.session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        super.init()
    }
    
    func makeRequestToUrl(url : String, requestType : RequestTypes?)
    {
        if let type = requestType {
            let method = requestType
        } else {
            let method = RequestTypes.GET
        }
        
        
    }
}