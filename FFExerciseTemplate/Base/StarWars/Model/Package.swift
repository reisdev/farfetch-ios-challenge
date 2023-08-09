//
//  PeoplePackage.swift
//  FFExerciseTemplate
//
//  Created by João David on 15/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import Foundation

struct Package: Decodable {

    let count: Int
    let next: String?
    let previous: String?
    let results: [People]
}
