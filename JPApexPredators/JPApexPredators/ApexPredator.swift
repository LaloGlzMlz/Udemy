//
//  Untitled.swift
//  JPApexPredators
//
//  Created by Eduardo Gonzalez Melgoza on 21/01/25.
//

import SwiftUI
import MapKit

struct ApexPredator: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: APType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    struct MovieScene: Decodable, Identifiable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
}


enum APType: String, Decodable, CaseIterable, Identifiable {
    case all
    case land
    case sea
    case air
    
    var id: APType {
        self
    }
    
    var backgroundColor: Color {
        switch self {
        case .land:
                .brown
        case .sea:
                .blue
        case .air:
                .teal
        case .all:
                .black
        }
    }
    
    var icon: String {
        switch self {
        case .all:
            "square.stack.3d.up.fill"
        case .sea:
            "leaf.fill"
        case .air:
            "wind"
        case .land:
            "drop.fill"
        }
    }
}
