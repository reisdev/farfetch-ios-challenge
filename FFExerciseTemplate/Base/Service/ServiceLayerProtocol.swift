//
//  ServiceLayer.swift
//  FFExerciseTemplate
//
//  Created by João David on 16/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import Foundation

protocol ServiceLayerProtocol {

    var networkLayer: NetworkLayer { get }

    init(config: NetworkConfig)
}

extension ServiceLayerProtocol {

    func requestIndividualEntity<T: Decodable>(with request: Request, completion: @escaping (T?) -> Void) {

        try! self.networkLayer.execute(request: request) { (result: Result<T>) in

            switch result {

            case .error(let message):
                print(message)
                completion(nil)

            case .success(let entity):
                completion(entity)
            }
        }
    }
}
