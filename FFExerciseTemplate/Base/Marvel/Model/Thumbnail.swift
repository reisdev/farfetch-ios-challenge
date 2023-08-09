//
//  Thumbnail.swift
//  FFExerciseTemplate
//
//  Created by João David on 18/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import Foundation

struct Thumbnail: Codable {
    
    fileprivate let path: String
    fileprivate let fileExtension: String

    var absoluteUrl: String? {

        return path + ".\(fileExtension)"
    }

    fileprivate enum CodingKeys: String, CodingKey {

        case path
        case fileExtension = "extension"
    }
}
