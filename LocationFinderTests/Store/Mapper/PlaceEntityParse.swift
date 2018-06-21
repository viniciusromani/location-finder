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
@testable import LocationFinder

class PlaceEntityParse: XCTestCase {
    
    var _localJSON: String = ""
    let disposeBag = DisposeBag()
    
    func testPlaceEntityParse() {
        
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
}

extension PlaceEntityParse: TestableEntityMapper {
    
    var localJSON: String {
        get { return _localJSON }
        set { _localJSON = newValue }
    }
}
