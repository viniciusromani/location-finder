//
//  DeletePlaceUseCase.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 21/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import MapKit

struct DeletePlaceUseCase {
    
    let repository: CoreDataRepository
    
    func deletePlace(with location: CLLocation) {
        let latitude = Float(location.coordinate.latitude)
        let longitude = Float(location.coordinate.longitude)
        
        repository.delete(with: latitude, and: longitude)
    }
}
