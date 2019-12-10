//
//  Network.swift
//  Swift Apollo Client
//
//  Created by Victor Shinya on 10/12/19.
//  Copyright © 2019 Victor Shinya. All rights reserved.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
}
