//
//  StarWarsTestViewController.swift
//  FFExerciseTemplate
//
//  Created by João David on 15/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import UIKit

/**
 *   AR_E1
 *
 *   The goal of this exercise is to grab information from SWAPI https://swapi.dev/ relative to a people (character).
 *   You should first take a look at the API documentation.
 *   In order to achieve this you will need to:
 *
 *   1 - Create a Datasource that is capable of fetching all data relative to people with id [1]
 *   2 - The datasource will have to request the people/1 and grab information about:
 *       a. The 1st Film
 *       b. The 1st Specie
 *       c. The 1st Vehicle
 *       d. The 1st Starship
 *   3 - The request should be made by button Request action
 *   4 - After you receive your response from the Datasource, you should fill in the textArea as follows:
 *       Name: Luke Skywalker
 *       Film: <name_of_the_first_movie>
 *       Specie: <name_of_the_first_specie>
 *       Vehicle: <name_of_the_first_vehicle>
 *       Starship: <name_of_the_first_starship>
 *
 *   Requirements:
 *   - Use the already created StarWarsDatasource for convinience
 *   - The model is already available and they conform to the protocol Decodable
 *   - You MUST use the already available artefacts (ServiceLayerSW)
 *   - To parse the ID from an hypermedia URL, use the already provided func parsedHypermediaId() -> Int? in StringExtensions.
 *   - The Datasource can only report back to the current ViewController when ALL information is available
 *   - You should create a very clear communication interface between the Datasource and the current ViewController
 */
final class StarWarsTestViewController: UIViewController {

    @IBOutlet weak var textArea: UITextView!
    
    private var dataSource: StarWarsDatasource?

    override func viewDidLoad() {

        super.viewDidLoad()
        
        let config = NetworkConfig("Star Wars API", baseUrl: "https://swapi.dev/api")
        let serviceLayer = ServiceLayerSW(config: config)
        
        self.dataSource = StarWarsDatasource(serviceLayer: serviceLayer)

        self.title = "AR-E1"
    }

    @IBAction func request(_ sender: Any) {
        dataSource?.fetch { [weak self] (people, film,specie,vehicle,starship) in
            guard let self else { return }
            
            textArea.text = """
            Name: \(people?.name ?? "")
            Film: \(film?.title ?? "")
            Specie: \(specie?.name ?? "")
            Vehicle: \(vehicle?.name ?? "")
            Starship: \(starship?.name ?? "")
            """
        }
    }
}
