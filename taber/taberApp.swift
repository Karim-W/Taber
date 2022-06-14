//
//  taberApp.swift
//  taber
//
//  Created by Karim Hassan on 14/06/2022.
//

import SwiftUI

@main
struct taberApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
