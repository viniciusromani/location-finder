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
    
    let useCase = DeletePlaceUseCase(repository: CoreDataLocalRepository())
    
    func testSavePlace() {
        let latitude: CLLocationDegrees = CLLocationDegrees(39.7817213)
        let longitude: CLLocationDegrees = CLLocationDegrees(-89.6501481)
        let wasDeleted = useCase.deletePlace(with: CLLocation(latitude: latitude, longitude: longitude))
        XCTAssertTrue(wasDeleted, "Place was deleted successfully")
    }
}
