//
//  CoreDataHelpers.swift
//  CityBikes
//
//  Created by Tyler Perkins on 9/25/22.
//

import Foundation

import CoreData



public class CoreDataHelper {
    let context: NSManagedObjectContext
    
    public init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    
    public func bikeNetworks() {
        let bikeNetworks = [
            (city: "Orlando, FL",country: "US",latitude: 28.536663311743688,longitude: -81.37922197580338,company: ["CycleHop, LLC", "Social Bicycles Inc."], name: "Juice",id: "juice-bike-share"),
            (city: "New York, NY",country: "US",latitude: 40.7143528,longitude: -74.00597309999999,company: ["NYC Bike Share, LLC", "Motivate International", "PBSC Urban Solutions"], name: "Citi Bike",id: "citi-bike-nyc"),
            (city: "Chicago, IL",country: "US",latitude: 41.8781136,longitude: -87.6297982,company: ["Motivate International, Inc.", "PBSC Urban Solutions"], name: "Divvy",id: "divvy"),
            (city: "Copenhagen",country: "DK",latitude: 55.673582,longitude: 12.564984,company: ["Gobike A/S"],name: "Bycyklen",id: "bycyklen"),
            (city: "Utrecht",country: "NL",latitude: 52.117,longitude: 5.067,company: ["Gobike A/S"],name: "Nu-Connect",id: "nu-connect")
        ]
        
        for bikeNetwork in bikeNetworks {
            let newBikeNetwork = NSEntityDescription.insertNewObject(forEntityName: "BikeNetwork", into: context) as! BikeNetwork
            newBikeNetwork.city = bikeNetwork.city
            newBikeNetwork.country = bikeNetwork.country
            newBikeNetwork.latitude = bikeNetwork.latitude
            newBikeNetwork.longitude = bikeNetwork.longitude
            newBikeNetwork.company = bikeNetwork.company
            newBikeNetwork.name = bikeNetwork.name
            newBikeNetwork.id = newBikeNetwork.id
        }
        
        do {
            try context.save()
        } catch {
            
        }
    }
}

func setUpInMemoryManagedObjectContext() -> NSManagedObjectContext {
    
    let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle.main])!

    let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)

    do {
        try persistentStoreCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
    } catch {
        print("Adding in-memory persistent store failed")
    }

    let managedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
    managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator

    return managedObjectContext
}



