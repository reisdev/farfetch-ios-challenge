//
//  StarWarsDatasource.swift
//  FFExerciseTemplate
//
//  Created by João David on 20/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import Foundation

/**
 *   AR_E1
 *
 *   1 - Use ServiceLayerSW to grab your network model
 *   2 - Take into account an adequate encapsulation
 */
final class StarWarsDatasource {
    
    private let serviceLayer: ServiceLayerSW

    init(serviceLayer: ServiceLayerSW) {
        self.serviceLayer = serviceLayer
    }
    
    func fetch(completion: @escaping (People?,Films?,Species?,Vehicles?,Starships?) -> Void) {
        serviceLayer.requestIndividual(with: 1) { [weak self] people in
            guard let self, let people else { return }
            
            var film: Films?
            var specie: Species?
            var vehicle: Vehicles?
            var starship: Starships?
            
            let group = DispatchGroup()
            
            if let films = people.films, let filmId = films.first?.parsedHypermediaId() {
                group.enter()
                
                self.serviceLayer.requestFilm(with: filmId) { response in
                    film = response
                    group.leave()
                }
            }
            
            if let species = people.species, let specieId = species.first?.parsedHypermediaId() {
                group.enter()
                self.serviceLayer.requestSpecie(with: specieId) { response in
                    specie = response
                    group.leave()
                }
            }
            
            if let vehicles = people.vehicles, let vehicleId = vehicles.first?.parsedHypermediaId() {
                group.enter()
                self.serviceLayer.requestVehicle(with: vehicleId) { response in
                    vehicle = response
                    group.leave()
                }
            }
            
            if let starships = people.starships, let starshipId = starships.first?.parsedHypermediaId() {
                group.enter()
                self.serviceLayer.requestStarship(with: starshipId) { response in
                    starship = response
                    group.leave()
                }
            }
            
            group.notify(queue: .main) {
                completion(people, film, specie, vehicle, starship)
            }
        }
    }
}
