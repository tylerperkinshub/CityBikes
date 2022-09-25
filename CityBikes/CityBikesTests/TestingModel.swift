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


    func testBikeNetworksCanStoreObejects() {
        let managedObjectContext = setUpInMemoryManagedObjectContext()
        let dataHelper = CoreDataHelper(context: managedObjectContext)
        
        dataHelper.bikeNetworks()
        
        let fetchRequest = NSFetchRequest<BikeNetwork>(entityName: "CityBikes")
        do {
            let bikeNetworks = try managedObjectContext.fetch(fetchRequest)
            XCTAssertNotNil(bikeNetworks)
            XCTAssertTrue(bikeNetworks.count == 5, "There should have been 5 bike networks inserted by bikeNetworks()")
        } catch {}
    }
    
   

}
