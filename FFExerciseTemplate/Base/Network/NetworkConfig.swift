//
//  NetworkConfig.swift
//  FFExerciseTemplate
//
//  Created by João David on 15/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import Foundation

struct NetworkConfig {

    let name: String
    let baseUrl: String
    var apiKey: String?
    var secret: String?
    var headers: [String: String] = [:]
    var cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData

    init(_ name: String, baseUrl: String) {
        
        self.name = name
        self.baseUrl = baseUrl
    }
}
