//
//  PlaceViewModel+Mappable.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

extension PlaceViewModel: MappableViewModel {
    typealias Model = PlaceModel
    
    init(mapping model: PlaceModel) {
        address = model.address
        location = model.location
        latitude = "\(String(format: "%.05f", model.location.coordinate.latitude))"
        longitude = "\(String(format: "%.05f", model.location.coordinate.longitude))"
    }
}
