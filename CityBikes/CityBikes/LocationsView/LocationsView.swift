//
//  ContentView.swift
//  CityBikes
//
//  Created by Tyler Perkins on 9/17/22.
//

import SwiftUI
import CoreData

struct LocationsView: View {
    
    @StateObject var viewModel = LocationsViewModel()
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.country), SortDescriptor(\.city)])
    var bikes: FetchedResults<BikeNetwork>

    let bikesNetworkManager: BikeNetworkManager!
    
    var body: some View {

        NavigationView {
            List {
                ForEach(bikes, id: \.id) { bike in
                    NavigationLink(destination:
                                    LocationDetailView(bike: bike)) {
                        NetworkCell(bikeNetwork: bike)

                    }
                    
                }
            }
            .navigationTitle("Bike Networks")
            
        }
        .onAppear(perform: checkDataLoad)
    }
    
    func checkDataLoad() {
        BikeNetworkManager.getBikeNetworks { bikesNetwork in
            
            
            Task {
                if bikes.isEmpty {
                    
                    bikesNetworkManager.saveToCityBikes(from: bikesNetwork, using: moc)
                }

            }
        }
    }
    
    
}
