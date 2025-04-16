//
//  DexApp.swift
//  Dex
//
//  Created by Eduardo Gonzalez Melgoza on 06/03/25.
//

import SwiftUI

@main
struct DexApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
