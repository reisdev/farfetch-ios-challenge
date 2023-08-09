//
//  Planets.swift
//  FFExerciseTemplate
//
//  Created by João David on 20/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import Foundation

struct Planets: Decodable {

    let name: String?
    let rotationPeriod: String?
    let orbitalPeriod: String?
    let diameter: String?
    let climate: String?
    let gravity: String?
    let terrain: String?
    let surfaceWater: String?
    let population: String?

    fileprivate enum CodingKeys: String, CodingKey {

        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter
        case climate
        case gravity
        case terrain
        case surfaceWater = "surface_water"
        case population
    }
}
