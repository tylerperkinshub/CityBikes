//
//  LocationDetailView.swift
//  CityBikes
//
//  Created by Tyler Perkins on 9/23/22.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    let padding = CGFloat(8)
    

    
    //@State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(bike.latitude), longitude: CLLocationDegrees(bike.longitude)), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    let bike: BikeNetwork

    
    var body: some View {
        
 
        VStack{
            NavigationView {

                //Map(coordinateRegion: $mapRegion)
                
            }
            .frame(width: UIScreen.screenWidth, height: 350)
            .navigationTitle(String(bike.city ?? ""))
            
            
            HStack {
                VStack(alignment: .leading){
                    Text("Latitude")
                        .font(.system(size: 16, weight: .medium))
                    Text(String(bike.latitude))
                        .font(.system(size: 16, weight: .light))
                    Text("Longitude")
                        .font(.system(size: 16, weight: .medium))
                    Text(String(bike.longitude))
                        .font(.system(size: 16, weight: .light))
                    Spacer()
                }
                .frame(width: (UIScreen.screenWidth / 2) - padding * 2, height: 100, alignment: .leading)
                VStack(alignment: .leading){
                    Text("Companies")
                        .font(.system(size: 16, weight: .medium))
                    Text(returnCompaniesToString(companies: bike.company ?? []))
                        .font(.system(size: 16, weight: .light))
                    Spacer()
                }
                .frame(width: (UIScreen.screenWidth / 2) - padding * 2, height: 100, alignment: .leading)
            }
            .frame(width: UIScreen.screenWidth, height: 150)
            Spacer()
        }
    }
}
