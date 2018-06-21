//
//  CoreDataRepository.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 21/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

protocol CoreDataRepository {
    func save(placeEntity place: PlaceEntity)
    func fetchPlace(with latitude: Float, and longitude: Float) -> PlaceEntity?
    func delete(placeEntity place: PlaceEntity)
}
