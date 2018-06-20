//
//  PlaceEntity+MappableEntity.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Moya
import RxSwift

struct RawResponse: Decodable {
    let places: [PlaceEntity]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        places = try values.decode([PlaceEntity].self, forKey: .results)
    }
}

extension PlaceEntity: MappableEntity {
    enum CodingKeys: String, CodingKey {
        case geometry = "geometry"
        case location = "location"
        
        case address = "formatted_address"
        case latitude = "lat"
        case longitude = "lng"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        address = try values.decode(String.self, forKey: .address)
        
        let geometry = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .geometry)
        let location = try geometry.nestedContainer(keyedBy: CodingKeys.self, forKey: .location)
        latitude = try location.decode(Float.self, forKey: .latitude)
        longitude = try location.decode(Float.self, forKey: .longitude)
    }
}

extension ObservableType where E == Response {
    
    func mapPlaces() -> Observable<[PlaceEntity]> {
        let mappedEntities = flatMap { response -> Observable<[PlaceEntity]> in
            guard let results = try? JSONDecoder().decode(RawResponse.self, from: response.data) else {
                return Observable.error(MapperError.cannotMapToEntity)
            }
            return Observable.just(results.places)
        }
        return mappedEntities
    }
}

