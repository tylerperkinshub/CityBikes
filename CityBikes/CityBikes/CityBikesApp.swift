//
//  CityBikesApp.swift
//  CityBikes
//
//  Created by Tyler Perkins on 9/17/22.
//

import SwiftUI
import CoreData


@main
struct CityBikesApp: App {
    var body: some Scene {
                
        let persistenceController = PersistenceController.shared
        
        
        WindowGroup {
            LocationsView(bikesNetworkManager: BikeNetworkManager.init())
                .environment(\.managedObjectContext, persistenceController.mainContext)

        }
    }
}
