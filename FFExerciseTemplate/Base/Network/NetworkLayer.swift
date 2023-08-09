//
//  NetworkLayer.swift
//  FFExerciseTemplate
//
//  Created by João David on 15/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import Foundation

enum Result<T> {

    case success(T)
    case error(String)
}

public enum NetworkErrors: Error {

    case badInput
    case noData
}

public protocol NetworkLayerDelegate: class {

    func hashGeneration(usingTimestamp timestamp: String, apikey: String, secret: String) -> String
}

final class NetworkLayer {

    fileprivate let networkConfig: NetworkConfig
    fileprivate let session: URLSession
    weak var delegate: NetworkLayerDelegate?

    required init(networkConfig: NetworkConfig) {

        self.networkConfig = networkConfig
        self.session = URLSession(configuration: URLSessionConfiguration.default)
    }

    func execute<T: Decodable>(request: Request, completion: @escaping (Result<T>) -> Void) throws {

        let request = try self.prepareURLRequest(for: request)

        self.session.dataTask(with: request) { (data, response, error) in

            guard let data = data else {

                return completion(.error("No data"))
            }

            guard error == nil else {

                return completion(.error("Error with statusCode: \(String(describing: (response as? HTTPURLResponse)?.statusCode))"))
            }

            do {

                let decoder = JSONDecoder()
                let objectRepresentation = try decoder.decode(T.self, from: data)

                completion(.success(objectRepresentation))

            } catch let jsonError {

                print(jsonError)
                return completion(.error("Error parsing model"))
            }

        }.resume()
    }

    private func prepareURLRequest(for request: Request) throws -> URLRequest {

        let url = "\(networkConfig.baseUrl)/\(request.path)"
        var urlRequest = URLRequest(url: URL(string: url)!)

        // Working with parameters
        switch request.parameters {

        case .body(let params)?:

            if let params = params as? [String: String] {

                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: .init(rawValue: 0))

            } else {

                throw NetworkErrors.badInput
            }

        case .url(let params)?:

            if let params = params as? [String: String] {

                let queryParams = params.map({ (element) -> URLQueryItem in

                    return URLQueryItem(name: element.key, value: element.value)
                })

                guard var components = URLComponents(string: url) else {

                    throw NetworkErrors.badInput
                }

                components.queryItems = queryParams
                urlRequest.url = components.url

            } else {

                throw NetworkErrors.badInput
            }
        case .none:
            
            print("no params")
        }

        if let delegate = delegate {

            // handles apiKey and hash
            if let apiKey = networkConfig.apiKey,
                let secret = networkConfig.secret,
                let absoluteUrlString = urlRequest.url?.absoluteString {

                guard var components = URLComponents(string: absoluteUrlString) else {

                    throw NetworkErrors.badInput
                }

                var modifiedQueryItems = components.queryItems

                if modifiedQueryItems == nil {

                    modifiedQueryItems = [URLQueryItem]()
                }

                let timestamp = String.timestamp()
                let hash = delegate.hashGeneration(usingTimestamp:timestamp, apikey: apiKey, secret: secret)

                modifiedQueryItems?.append(URLQueryItem(name: "ts", value: timestamp))
                modifiedQueryItems?.append(URLQueryItem(name: "apikey", value: apiKey))
                modifiedQueryItems?.append(URLQueryItem(name: "hash", value: hash))

                components.queryItems = modifiedQueryItems
                urlRequest.url = components.url
            }
        }

        // Add headers from enviornment and request
        networkConfig.headers.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.key) }
        request.headers?.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.key) }

        // Setup HTTP method
        urlRequest.httpMethod = request.method.rawValue

        return urlRequest
    }
}
