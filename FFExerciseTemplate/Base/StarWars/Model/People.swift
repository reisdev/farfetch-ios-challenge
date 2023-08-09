//
//  People.swift
//  FFExerciseTemplate
//
//  Created by João David on 15/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import Foundation

struct People: Decodable {

    let name: String?
    let height: String?
    let mass: String?
    let hairColor: String?
    let films: [String]?
    let species: [String]?
    let vehicles: [String]?
    let starships: [String]?

    fileprivate enum CodingKeys: String, CodingKey {

        case name
        case height
        case mass
        case hairColor = "hair_color"
        case films
        case species
        case vehicles
        case starships
    }
}
