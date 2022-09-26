//
//  LocationDetailViewModel.swift
//  CityBikes
//
//  Created by Tyler Perkins on 9/26/22.
//

import Foundation
import MapKit

final class LocationDetailViewModel: ObservableObject {
    
    let bike = BikeNetwork()
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    
}
