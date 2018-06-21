//
//  SavePlaceUseCaseTests.swift
//  LocationFinderTests
//
//  Created by Vinicius Romani on 21/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import XCTest
import MapKit
@testable import LocationFinder

class SavePlaceUseCaseTests: XCTestCase {
    
    let useCase = SavePlaceUseCase(repository: CoreDataLocalRepository())
    
    func testSavePlace() {
        let address = "Springfield, IL, USA"
        let latitude: CLLocationDegrees = CLLocationDegrees(39.7817213)
        let longitude: CLLocationDegrees = CLLocationDegrees(-89.6501481)
        let placeModel = PlaceModel(address: address, location: CLLocation(latitude: latitude, longitude: longitude))
        let wasSaved = useCase.save(placeModel: placeModel)
        XCTAssertTrue(wasSaved, "Place was saved successfully")
    }
}
