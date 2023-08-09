//
//  Species.swift
//  FFExerciseTemplate
//
//  Created by João David on 20/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import Foundation

struct Species: Decodable {

    let name: String?
    let classification: String?
    let designation: String?
    let averageHeight: String?
    let skinColors: String?
    let hairColors: String?
    let eyeColors: String?
    let averageLifespan: String?
    let homeworld: String?
    let language: String?

    fileprivate enum CodingKeys: String, CodingKey {

        case name
        case classification
        case designation
        case averageHeight = "average_height"
        case skinColors = "skin_colors"
        case hairColors = "hair_colors"
        case eyeColors = "eye_colors"
        case averageLifespan = "average_lifespan"
        case homeworld
        case language
    }
}
