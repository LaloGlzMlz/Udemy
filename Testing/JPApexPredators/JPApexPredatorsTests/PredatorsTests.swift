//
//  PredatorsTests.swift
//  JPApexPredatorsTests
//
//  Created by Eduardo Gonzalez Melgoza on 04/02/25.
//

import XCTest
@testable import JPApexPredators

final class PredatorsTests: XCTestCase {
    var predators: Predators!
    var samplePredators: [ApexPredator]!
    var alphabetical: Bool!
    
    override func setUp() {
        super.setUp()
        
        // Create sample predators
        samplePredators = [
            ApexPredator(
                id: 1,
                name: "T-Rex",
                type: .land,
                latitude: 40.0,
                longitude: -100.0,
                movies: ["Jurassic Park"],
                movieScenes: [ApexPredator.MovieScene(
                    id: 1,
                    movie: "Jurassic Park",
                    sceneDescription: "Famous T-Rex scene")],
                link: "https://jurassicpark.com"),
            ApexPredator(
                id: 2,
                name: "Megalodon",
                type: .sea,
                latitude: 20.0,
                longitude: -80.0,
                movies: ["The Meg"],
                movieScenes: [ApexPredator.MovieScene(
                    id: 1,
                    movie: "The Meg",
                    sceneDescription: "Megalodon attacks")],
                link: "https://themeg.com"),
            ApexPredator(
                id: 3,
                name: "Pteranodon",
                type: .air,
                latitude: 30.0,
                longitude: -90.0,
                movies: ["Jurassic World"],
                movieScenes: [ApexPredator.MovieScene(
                    id: 1,
                    movie: "Jurassic World",
                    sceneDescription: "Flying through the park")],
                link: "https://jurassicworld.com")
        ]
        
        predators = Predators()
        predators.allPredators = samplePredators // overwriting the real list with samplePredators
        alphabetical = true
    }
    
    override func tearDown() {
        predators = nil
        samplePredators = nil
        super.tearDown()
    }
    
    func testFilterByLandType() {
        predators.filter(by: .land)
        XCTAssertEqual(predators.apexPredators.count, 1)
        XCTAssertEqual(predators.apexPredators.first?.name, "T-Rex")
    }
    
    func testFilterBySeaType() {
        predators.filter(by: .sea)
        XCTAssertEqual(predators.apexPredators.count, 1)
        XCTAssertEqual(predators.apexPredators.first?.name, "Megalodon")
    }
    
    func testFilterByAirType() {
        predators.filter(by: .air)
        XCTAssertEqual(predators.apexPredators.count, 1)
        XCTAssertEqual(predators.apexPredators.first?.name, "Pteranodon")
    }
    
    func testFilterByAllTypes() {
        predators.filter(by: .all)
        XCTAssertEqual(predators.apexPredators.count, 3)
    }
    
//    func testSortAlphabetically() {
//        predators.sort(by: alphabetical)
//        XCTAssertEqual(predators.apexPredators.first?.name, "Megalodon")
//    }
}
