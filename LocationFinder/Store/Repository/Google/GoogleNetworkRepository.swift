//
//  GoogleNetworkRepository.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Moya
import RxSwift

struct GoogleNetworkRepository: GoogleRepository {
    
    let provider = MoyaProvider<LocationFinderAPI>(manager: NetworkSettings.requestManager)
    
    func fetchPlaces(for placeName: String) -> Observable<[PlaceEntity]> {
        return provider.rx.request(.fetchPlace(placeName))
            .asObservable()
            .debug()
            .filterSuccessfulStatusCodes()
            .catchHTTPError()
            .mapPlaces()
    }
}
