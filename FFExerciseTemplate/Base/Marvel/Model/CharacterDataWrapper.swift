//
//  CharacterDataWrapper.swift
//  FFExerciseTemplate
//
//  Created by João David on 17/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import Foundation

struct CharacterDataWrapper: Decodable {

    let code: Int?
    let status: String?
    let copyright: String?
    let data: CharacterDataContainer?
}
