//
//  ServiceLayerSW.swift
//  FFExerciseTemplate
//
//  Created by João David on 16/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import Foundation

final class ServiceLayerSW: ServiceLayerProtocol {

    internal let networkLayer: NetworkLayer

    init(config: NetworkConfig) {

        self.networkLayer = NetworkLayer(networkConfig: config)
    }

    func requestAllPeople(completion: @escaping ([People]?) -> Void) {

        let peopleRequest: PeopleRequest = .all
        
        try! self.networkLayer.execute(request: peopleRequest) { (result: Result<Package>) in

            switch result {

            case .error(let message):
                print(message)
                completion(nil)

            case .success(let peoplePackage):
                completion(peoplePackage.results)
            }
        }

        return
    }

    func requestIndividual(with individualId: Int, completion: @escaping (People?) -> Void) {

        let individualRequest: PeopleRequest = .individual(number: individualId)

        self.requestIndividualEntity(with: individualRequest, completion: completion)
    }

    func requestFilm(with filmId: Int, completion: @escaping (Films?) -> Void) {

        let filmRequest: FilmsRequest = .individual(number: filmId)

        self.requestIndividualEntity(with: filmRequest, completion: completion)
    }

    func requestSpecie(with specieId: Int, completion: @escaping (Species?) -> Void) {

        let specieRequest: SpeciesRequest = .individual(number: specieId)

        self.requestIndividualEntity(with: specieRequest, completion: completion)
    }

    func requestVehicle(with vehicleId: Int, completion: @escaping (Vehicles?) -> Void) {

        let vehicleRequest: VehiclesRequest = .individual(number: vehicleId)

        self.requestIndividualEntity(with: vehicleRequest, completion: completion)
    }

    func requestStarship(with starshipId: Int, completion: @escaping (Starships?) -> Void) {

        let starshipRequest: StarshipsRequest = .individual(number: starshipId)

        self.requestIndividualEntity(with: starshipRequest, completion: completion)
    }

    func requestPlanet(with planetsId: Int, completion: @escaping (Planets?) -> Void) {

        let planetsRequest: PlanetsRequest = .individual(number: planetsId)

        self.requestIndividualEntity(with: planetsRequest, completion: completion)
    }
}
