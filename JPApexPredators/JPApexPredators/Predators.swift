//
//  Predators.swift
//  JPApexPredators
//
//  Created by Eduardo Gonzalez Melgoza on 21/01/25.
//

import Foundation

class Predators {
    var allPredators: [ApexPredator] = []
    var apexPredators: [ApexPredator] = []
    
    init() {
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allPredators
            } catch {
                print("Error decoding JSON data \(error)")
            }
        }
    }
    
    func search(for searchText: String) -> [ApexPredator] {
        if searchText.isEmpty {
            return apexPredators
        } else {
            return apexPredators.filter { predator in
                predator.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    func sort(by alphabetical: Bool) {
        apexPredators.sort { predator1, predator2 in
            if alphabetical {
                predator1.name < predator2.name
            } else {
                predator1.id < predator2.id
            }
        }
    }
    
    func filter(by type: APType) {
        if type == .all {
            apexPredators = allPredators
        } else {
            apexPredators = allPredators.filter { predator in
                predator.type == type
            }
        }
    }
}
