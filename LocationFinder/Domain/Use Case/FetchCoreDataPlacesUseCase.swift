//
//  FetchCoreDataPlacesUseCase.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 21/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import MapKit

struct FetchCoreDataPlacesUseCase {
    
    let repository: CoreDataRepository
    
    func fetchPlace(with location: CLLocation) -> PlaceModel? {
        let latitude = Float(location.coordinate.latitude)
        let longitude = Float(location.coordinate.longitude)
        
        guard let placeEntity = repository.fetchPlace(with: latitude, and: longitude) else { return nil }
        do {
            let placeModel = try PlaceModel(mapping: placeEntity)
            return placeModel
        } catch {
            return nil
        }
    }
}
