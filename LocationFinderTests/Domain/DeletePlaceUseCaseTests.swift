//
//  DeletePlaceUseCaseTests.swift
//  LocationFinderTests
//
//  Created by Vinicius Romani on 21/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import XCTest
import MapKit
@testable import LocationFinder

class DeletePlaceUseCaseTests: XCTestCase {
    
    let saveUseCase = SavePlaceUseCase(repository: CoreDataLocalRepository())
    let useCase = DeletePlaceUseCase(repository: CoreDataLocalRepository())
    
    override func setUp() {
        let placeModel = PlaceModel(address: "Springfield, IL, USA",
                                    location: CLLocation(latitude: 39.7817213, longitude: -89.6501481))
        let wasSaved = saveUseCase.save(placeModel: placeModel)
        XCTAssertTrue(wasSaved)
    }
    
    func testDeletePlace() {
        let latitude: CLLocationDegrees = CLLocationDegrees(39.7817213)
        let longitude: CLLocationDegrees = CLLocationDegrees(-89.6501481)
        let wasDeleted = useCase.deletePlace(with: CLLocation(latitude: latitude, longitude: longitude))
        XCTAssertTrue(wasDeleted, "Place was deleted successfully")
    }
}
