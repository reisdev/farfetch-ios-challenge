//
//  RequestProtocol.swift
//  FFExerciseTemplate
//
//  Created by João David on 15/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import Foundation

enum HTTPMethod: String {

    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
    case patch = "PATCH"
}

enum RequestParams {

    case body(_ : [String: Any]?)
    case url(_ : [String: Any]?)
}

protocol Request {

    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: RequestParams? { get }
    var headers: [String: String]? { get }
}
