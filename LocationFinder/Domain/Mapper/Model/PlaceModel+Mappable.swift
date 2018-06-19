//
//  PlaceModel+Mappable.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import RxSwift
import MapKit

extension PlaceModel: MappableModel {
    typealias Entity = PlaceEntity
    
    init(mapping entity: PlaceEntity) throws {
        address = entity.address
        let latitude = CLLocationDegrees(entity.latitude)
        let longitude = CLLocationDegrees(entity.longitude)
        let entityLocation = CLLocation(latitude: latitude, longitude: longitude)
        location = entityLocation
    }
}

extension ObservableType where E == Array<PlaceEntity> {
    func mapPlaces() -> Observable<[PlaceModel]> {
        return flatMap { entities -> Observable<[PlaceModel]> in
            do {
                let models = try PlaceModel.array(mapping: entities)
                return Observable.just(models)
            } catch let error {
                return Observable.error(error)
            }
        }
    }
}
