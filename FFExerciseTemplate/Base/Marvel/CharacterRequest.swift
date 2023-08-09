//
//  CharacterRequest.swift
//  FFExerciseTemplate
//
//  Created by João David on 15/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import Foundation

public enum CharacterRequest: Request {

    case all
    case individual(number: Int)

    var path: String {

        switch self {

        case .all:
            return "characters"

        case .individual(let number):
            return "characters/\(number)"
        }
    }

    var method: HTTPMethod {

        return .get
    }

    var parameters: RequestParams? {

        return nil
    }

    var headers: [String : String]? {

        return nil
    }
}
