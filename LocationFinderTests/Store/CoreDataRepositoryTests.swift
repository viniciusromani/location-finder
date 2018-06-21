//
//  CoreDataRepositoryTests.swift
//  LocationFinderTests
//
//  Created by Vinicius Romani on 21/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import XCTest
import CoreData
@testable import LocationFinder

class CoreDataRepositoryTests: XCTestCase {
    
    private lazy var repository = CoreDataLocalRepository(context: mockPersistantContainer.viewContext)
    
    lazy var mockPersistantContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "LocationFinder", managedObjectModel: self.managedObjectModel)
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        description.shouldAddStoreAsynchronously = false
        
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { (description, error) in
            precondition( description.type == NSInMemoryStoreType )
            
            if let error = error {
                fatalError("Create an in-mem coordinator failed \(error)")
            }
        }
        return container
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle(for: type(of: self))] )!
        return managedObjectModel
    }()
    
    func testSaving() {
        let placeEntity = PlaceEntity(address: "Springfield, IL, USA",
                                      latitude: 39.7817213,
                                      longitude: -89.6501481)
        let wasSaved = repository.save(placeEntity: placeEntity)
        XCTAssertTrue(wasSaved, "Place was saved successfully")
    }
    
    func testFetching() {
        testSaving()
        let placeEntity = repository.fetchPlace(with: 39.7817213, and: -89.6501481)
        XCTAssertNotNil(placeEntity, "Fetched successfully")
    }
    
    func testDeleting() {
        testSaving()
        let wasDeleted = repository.delete(with: 39.7817213, and: -89.6501481)
        XCTAssertTrue(wasDeleted, "Place was deleted")
    }
}
