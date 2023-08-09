//
//  Film.swift
//  FFExerciseTemplate
//
//  Created by João David on 20/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import Foundation

struct Films: Decodable {

    let title: String?
    let episodeId: Int?
    let openingCrawl: String?
    let director: String?
    let producer: String?

    fileprivate enum CodingKeys: String, CodingKey {

        case title
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case director
        case producer
    }
}
