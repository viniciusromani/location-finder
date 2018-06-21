//
//  PlaceEntityParse.swift
//  LocationFinderTests
//
//  Created by Vinicius Romani on 21/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import XCTest
import Moya
import RxSwift
import CoreData
import MapKit
@testable import LocationFinder

class PlaceEntityParse: XCTestCase {
    
    var _localJSON: String = ""
    let disposeBag = DisposeBag()
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
    
    func testPlaceEntityParseFromJSON() {
        
        let observable = Observable.of(response)
        let placeObservable = observable.mapPlaces()
        
        placeObservable.subscribe(onNext: { places in
            XCTAssert(places.count > 0)
            for place in places {
                XCTAssert(place.address.count > 0)
                XCTAssert(place.latitude != 0)
                XCTAssert(place.longitude != 0)
            }
        }).disposed(by: disposeBag)
    }
    
    func testPlaceEntityParseFromManagedObject() {
        let address = "Springfield, IL, USA"
        let latitude: Float = 39.7817213
        let longitude: Float = -89.6501481
        
        let entity = NSEntityDescription.entity(forEntityName: "Places", in: mockPersistantContainer.viewContext)
        let object = NSManagedObject(entity: entity!, insertInto: mockPersistantContainer.viewContext)
        object.setValue(address, forKey: "address")
        object.setValue(latitude, forKey: "latitude")
        object.setValue(longitude, forKey: "longitude")
        
        let placeEntity = PlaceEntity(mapping: object)
        
        XCTAssert(placeEntity.address == address)
        XCTAssert(placeEntity.latitude == latitude)
        XCTAssert(placeEntity.longitude == longitude)
    }
    
    func testPlaceEntityParseFromModel() {
        let address = "Springfield, IL, USA"
        let latitude = 39.7817213
        let longitude = -89.6501481
        
        let place = PlaceModel(address: address,
                               location: CLLocation(latitude: latitude,
                                                    longitude: longitude))
        do {
            let placeEntity = try PlaceEntity(mapping: place)
            XCTAssert(placeEntity.address == address)
            XCTAssert(placeEntity.latitude == Float(latitude))
            XCTAssert(placeEntity.longitude == Float(longitude))
        } catch {
            XCTFail("Parsing from model failed")
        }
    }
}

extension PlaceEntityParse: TestableEntityMapper {
    
    var localJSON: String {
        get { return _localJSON }
        set { _localJSON = newValue }
    }
}
