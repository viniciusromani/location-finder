//
//  PlaceModelMapper.swift
//  LocationFinderTests
//
//  Created by Vinicius Romani on 21/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import XCTest
import MapKit
@testable import LocationFinder

class PlaceModelMapper: XCTestCase {
    
    private let entity1 = PlaceEntity(address: "Springfield, IL, USA", latitude: 39.7817213, longitude: -89.6501481)
    private let entity2 = PlaceEntity(address: "Springfield, MA, USA", latitude: 42.1014831, longitude: -72.589811)
    
    func testPlaceModelMapper() {
        do {
            let placeModel = try PlaceModel(mapping: entity1)
            XCTAssert(placeModel.address == entity1.address)
            XCTAssert(placeModel.location.coordinate.latitude == Double(entity1.latitude))
            XCTAssert(placeModel.location.coordinate.longitude == Double(entity1.longitude))
        } catch {
            XCTFail("Could not map entity to model")
        }
    }
    
    func testPlaceModelArrayMapper() {
        do {
            let placeModelArray = try PlaceModel.array(mapping: [entity1, entity2])
            XCTAssert(placeModelArray.count == 2)
            
            XCTAssert(placeModelArray.first != nil)
            XCTAssert(placeModelArray.first?.address == entity1.address)
            XCTAssert(placeModelArray.first?.location.coordinate.latitude == Double(entity1.latitude))
            XCTAssert(placeModelArray.first?.location.coordinate.longitude == Double(entity1.longitude))
            
            XCTAssert(placeModelArray.last != nil)
            XCTAssert(placeModelArray.last?.address == entity2.address)
            XCTAssert(placeModelArray.last?.location.coordinate.latitude == Double(entity2.latitude))
            XCTAssert(placeModelArray.last?.location.coordinate.longitude == Double(entity2.longitude))
        } catch {
            XCTFail("Could not map entity to model")
        }
    }
}
