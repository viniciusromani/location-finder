//
//  EndpointTests.swift
//  LocationFinderTests
//
//  Created by Vinicius Romani on 21/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import XCTest
import Moya
@testable import LocationFinder

class EndpointTests: XCTestCase {
    
    private var endpoint: LocationFinderAPI!
    
    func testFetchFetchPlaceEndpoint() {
        endpoint = .fetchPlace("Springfield")
        
        // Base URL
        let url = URL(string: "https://maps.googleapis.com/")!
        XCTAssert(url == endpoint.baseURL)
        
        // Path
        let path = "maps/api/geocode/json"
        XCTAssert(path == endpoint.path)
        
        // Headers
        XCTAssert(endpoint.headers == nil)
    }
}
