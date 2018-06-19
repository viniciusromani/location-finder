//
//  PlaceEntity+MappableEntity.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

extension PlaceEntity: MappableEntity {
    enum CodingKeys: String, CodingKey {
        case results = "results"
        case geometry = "geometry"
        case location = "location"
        
        case address = "formatted_address"
        case latitude = "lat"
        case longitude = "lng"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let results = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .results)
        address = try results.decode(String.self, forKey: .address)
        
        let geometry = try results.nestedContainer(keyedBy: CodingKeys.self, forKey: .geometry)
        let location = try geometry.nestedContainer(keyedBy: CodingKeys.self, forKey: .location)
        latitude = try location.decode(Float.self, forKey: .latitude)
        longitude = try location.decode(Float.self, forKey: .longitude)
    }
}
