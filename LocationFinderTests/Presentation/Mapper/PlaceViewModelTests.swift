//
//  PlaceViewModelTests.swift
//  LocationFinderTests
//
//  Created by Vinicius Romani on 21/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import XCTest
import MapKit
@testable import LocationFinder

class PlaceViewModelTests: XCTestCase {
    
    private let placeModel = PlaceModel(address: "Springfield, IL, USA",
                                        location: CLLocation(latitude: 39.7817213, longitude: -89.6501481))
    
    func testSuccessfulMapping() {
        let viewModel = PlaceViewModel(mapping: placeModel)
        XCTAssert(viewModel.address == placeModel.address)
        XCTAssert(viewModel.latitude == "\(String(format: "%.05f", placeModel.location.coordinate.latitude))")
        XCTAssert(viewModel.longitude == "\(String(format: "%.05f", placeModel.location.coordinate.longitude))")
        XCTAssert(viewModel.location.coordinate.latitude == placeModel.location.coordinate.latitude)
        XCTAssert(viewModel.location.coordinate.longitude == placeModel.location.coordinate.longitude)
    }
}
