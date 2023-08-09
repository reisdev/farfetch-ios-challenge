//
//  CharacterDataContainer.swift
//  FFExerciseTemplate
//
//  Created by João David on 17/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import Foundation

struct CharacterDataContainer: Decodable {

    let offset: Int
    let limit: Int
    let results: [MarvelCharacter]
}
