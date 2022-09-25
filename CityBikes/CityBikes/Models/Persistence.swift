//
//  Persistence.swift
//  CityBikes
//
//  Created by Tyler Perkins on 9/17/22.
//

import CoreData
import SwiftUI

open class PersistenceController {
    
    static let shared = PersistenceController()
    
    public static let modelName = "CityBikes"
    
    public static let model: NSManagedObjectModel = {
        let modelURL = Bundle.main.url(forResource: modelName, withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    public var container: NSPersistentContainer!
        
    public init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: PersistenceController.modelName)
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        container.viewContext.name = "viewContext"
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.undoManager = nil
        container.viewContext.shouldDeleteInaccessibleFaults = true
    }
    
    public lazy var mainContext: NSManagedObjectContext = {
        return self.container.viewContext
    }()
}


