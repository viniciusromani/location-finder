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
        do {
            let placeEntity = try PlaceEntity(mapping: place)
            return repository.save(placeEntity: placeEntity)
        } catch {
            return false
        }
    }
}
