//
//  SavePlaceUseCase.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 21/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

struct SavePlaceUseCase {
    
    let repository: CoreDataRepository
    
    func save(placeModel place: PlaceModel) -> Bool {
        let latitude = Float(place.location.coordinate.latitude)
        let longitude = Float(place.location.coordinate.longitude)
        
        let placeEntity = PlaceEntity(address: place.address, latitude: latitude, longitude: longitude)
        
        return repository.save(placeEntity: placeEntity)
    }
}
