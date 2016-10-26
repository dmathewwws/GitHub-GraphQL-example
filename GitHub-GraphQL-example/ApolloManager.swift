//
//  ApolloManager.swift
//  GitHub-GraphQL-example
//
//  Created by Admin on 2016-10-16.
//  Copyright © 2016 ToyBox Media. All rights reserved.
//

import Foundation
import Apollo

struct ApolloManager {
    
    let apollo:ApolloClient
    static let shared = ApolloManager()
    
    init() {
        
        let url = URL(string: "https://api.github.com/graphql")!
        
        let urlSessionConfiguaration = URLSessionConfiguration.default
//        urlSessionConfiguaration.httpAdditionalHeaders = [
//            "Authorization":"bearer XXXX"
//        ]
        //ADD YOUR Auth Key to the header above
        
        let httpNetworkTransport = HTTPNetworkTransport(url: url, configuration: urlSessionConfiguaration)
        
        apollo = ApolloClient(networkTransport: httpNetworkTransport)
    }
    
    
}
