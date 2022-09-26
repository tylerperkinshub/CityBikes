//
//  TestingModel.swift.swift
//  CityBikesTests
//
//  Created by Tyler Perkins on 9/25/22.
//

import SwiftUI
import CoreData
import XCTest
import CityBikes

@testable import CityBikes

class TestingData: XCTestCase {

    func testGetBikeNetworks() {
        guard
            let path = Bundle.main.path(forResource: "test", ofType: "json")
        else { fatalError("Can't find json file") }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let response = try JSONDecoder().decode(Networks.self, from: data)
            
            for bikeNetworkProperties in response.networks {
                XCTAssertEqual(bikeNetworkProperties.name, "Juice")
                XCTAssertEqual(bikeNetworkProperties.company, ["CycleHop, LLC","Social Bicycles Inc."])
                XCTAssertEqual(bikeNetworkProperties.id, "juice-bike-share")
                XCTAssertEqual(bikeNetworkProperties.city, "Orlando, FL")
                XCTAssertEqual(bikeNetworkProperties.country, "US")
                XCTAssertEqual(bikeNetworkProperties.latitude, 28.536663311743688)
                XCTAssertEqual(bikeNetworkProperties.longitude, -81.37922197580338)
            }
            
        } catch {}
    }
    
    func testBikeNetworksCanStoreObejects() {

        var managedObjectContext = setUpInMemoryManagedObjectContext()
        var dataHelper = CoreDataHelper(context: managedObjectContext)
        
        dataHelper.bikeNetworks()
        
        let fetchRequest = NSFetchRequest<BikeNetwork>(entityName: "BikeNetwork")
        do {
            let bikeNetworks = try managedObjectContext.fetch(fetchRequest)
            XCTAssertNotNil(bikeNetworks)
            XCTAssertTrue(bikeNetworks.count == 5, "There should have been 5 bike networks inserted by bikeNetworks()")
        } catch {}
        
    }
    
    
    
    
    
    
    
    
    
}
