//
//  GoogleRepository.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import RxSwift

protocol GoogleRepository {
    func fetchPlaces(for placeName: String) -> Observable<[PlaceEntity]> 
}
