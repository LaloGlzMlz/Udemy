//
//  Dex4App.swift
//  Dex4
//
//  Created by Eduardo Gonzalez Melgoza on 03/02/25.
//

import SwiftUI

@main
struct Dex4App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
