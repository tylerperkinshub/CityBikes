//
//  BikeNetworkManager.swift
//  CityBikes
//
//  Created by Tyler Perkins on 9/24/22.
//

import CoreData
import Foundation
import SwiftUI



public struct BikeNetworkManager {
    
    static func saveToCityBikes(from bikeNetworkProperties: [BikesNetworkProperties], using managedObjectContext: NSManagedObjectContext) {

        var tmpNetwork = [BikeNetwork]()
        
        for bikeNetworkProperty in bikeNetworkProperties {
            let bikeNetwork = BikeNetwork(context: managedObjectContext)
            bikeNetwork.name = bikeNetworkProperty.name
            bikeNetwork.latitude = bikeNetworkProperty.latitude
            bikeNetwork.longitude = bikeNetworkProperty.longitude
            bikeNetwork.city = bikeNetworkProperty.city
            bikeNetwork.country = bikeNetworkProperty.country
            bikeNetwork.id = bikeNetworkProperty.id
            bikeNetwork.company = bikeNetworkProperty.company
            
            tmpNetwork.append(bikeNetwork)
        }
        
        let existingContext = managedObjectContext
        let newContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        newContext.persistentStoreCoordinator = existingContext.persistentStoreCoordinator
        do {
            try newContext.save()

            print("Saved network call!")
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
    }

    
    static func updateCityBikes(from bikeNetworkProperties: [BikesNetworkProperties], using managedObjectContext: NSManagedObjectContext) {
        
        // In here I want to look at all my ids. See if I have a new unique id. Then take that new id and append and save to moc.
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>.init(entityName: "CityBikes")
        var tmpNetwork = [BikeNetwork]()

        for bikeNetwork in bikeNetworkProperties {
            
            fetchRequest.predicate = NSPredicate(format: "id = %@", bikeNetwork.id)
            
            do {
                let test = try managedObjectContext.fetch(fetchRequest)
                for i in test {
                    
                }
            } catch {
                
            }
        }
    }

    
    static func getBikeNetworks(completion: @escaping ([BikesNetworkProperties]) -> ()) {
        print("Fetching data")
        guard let url = URL(string: "https://api.citybik.es/v2/networks") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        let session = URLSession.shared.dataTask(with: request) { data, response, sessionError in
            guard let data = data else {
                print("Fetch failed: \(sessionError?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(Networks.self, from: data)
                
                completion(decoded.networks)
            }
            catch let decodingError {
                print("Decoding failed: \(decodingError.localizedDescription)")
            }
        }

        session.resume()
    }
    
    
}

extension BikeNetworkManager {

   
    
}
