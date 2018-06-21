//
//  GoogleRepositoryTests.swift
//  LocationFinderTests
//
//  Created by Vinicius Romani on 21/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import XCTest
@testable import LocationFinder

class GoogleRepositoryTests: XCTestCase {
    
    private let repository = GoogleNetworkRepository()
    
    func testFetchPlace() {
        let observable = repository.fetchPlaces(for: "Springfield")
        XCTAssert(observable != nil)
    }
}
