//
//  FetchCoreDataPlacesUseCaseTests.swift
//  LocationFinderTests
//
//  Created by Vinicius Romani on 21/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import XCTest
import MapKit
@testable import LocationFinder

class FetchCoreDataPlacesUseCaseTests: XCTestCase {
    
    let useCase = FetchCoreDataPlacesUseCase(repository: CoreDataLocalRepository())
    
    func testSavePlace() {
        let latitude: CLLocationDegrees = CLLocationDegrees(39.7817213)
        let longitude: CLLocationDegrees = CLLocationDegrees(-89.6501481)
        let placeEntity = useCase.fetchPlace(with: CLLocation(latitude: latitude, longitude: longitude))
        XCTAssertNotNil(placeEntity, "Fetched successfully")
    }
}
