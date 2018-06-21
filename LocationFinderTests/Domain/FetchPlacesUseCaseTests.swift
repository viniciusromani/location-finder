//
//  FetchPlacesUseCaseTests.swift
//  LocationFinderTests
//
//  Created by Vinicius Romani on 21/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import XCTest
@testable import LocationFinder

class FetchPlacesUseCaseTests: XCTestCase {
    
    private let useCase = FetchPlacesUseCase(repository: GoogleNetworkRepository())
    
    func testFetchPlace() {
        let observable = useCase.fetchPlaces(for: "Springfield")
        XCTAssert(observable != nil)
    }
}
