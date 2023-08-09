//
//  Vehicles.swift
//  FFExerciseTemplate
//
//  Created by João David on 20/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import Foundation

struct Vehicles: Decodable {

    let name: String?
    let model: String?
    let manufacturer: String?
    let costInCredits: String?
    let length: String?
    let maxAtmospheringSpeed: String?
    let crew: String?

    fileprivate enum CodingKeys: String, CodingKey {

        case name
        case model
        case manufacturer
        case costInCredits = "cost_in_credits"
        case length
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case crew
    }
}
