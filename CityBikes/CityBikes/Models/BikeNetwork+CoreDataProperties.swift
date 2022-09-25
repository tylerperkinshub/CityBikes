//
//  BikeNetwork+CoreDataProperties.swift
//  CityBikes
//
//  Created by Tyler Perkins on 9/23/22.
//
//

import SwiftUI
import CoreData


extension BikeNetwork {
    
    
    static func basicFetchRequest() -> FetchRequest<BikeNetwork> {
        return FetchRequest<BikeNetwork>(entity: BikeNetwork.entity(), sortDescriptors: [])
    }
    
    @NSManaged public var city: String?
    @NSManaged public var country: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var id: String?
    @NSManaged public var company: [String]?
    @NSManaged public var name: String?
    
    
    
}

