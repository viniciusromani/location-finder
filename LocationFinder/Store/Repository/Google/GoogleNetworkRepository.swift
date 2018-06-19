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
        let p1 = PlaceEntity(address: "Springfield, IL, USA", latitude: 39.78172130000001, longitude: -89.6501481)
        let p2 = PlaceEntity(address: "Springfield, MA, USA", latitude: 42.1014831, longitude: -72.589811)
        let p3 = PlaceEntity(address: "Springfield, MO, USA", latitude: 37.2089572, longitude: -93.29229889999999)
        let p4 = PlaceEntity(address: "Springfield, OR, USA", latitude: 44.0462362, longitude: -123.0220289)
        let p5 = PlaceEntity(address: "Springfield, OH, USA", latitude: 39.9242266, longitude: -83.8088171)
        let p6 = PlaceEntity(address: "Springfield, TN 37172, USA", latitude: 36.5092118, longitude: -86.8849984)
        let p7 = PlaceEntity(address: "Springfield, MN 56087, USA", latitude: 44.23882709999999, longitude: -94.97416539999999)
        
        let observable = Observable.of([p1, p2, p3, p4, p5, p6, p7])
        return observable
        
//        return provider.rx.request(.fetchPlace(placeName))
//            .asObservable()
//            .debug()
//            .filterSuccessfulStatusCodes()
//            .catchHTTPError()
//            .mapEntities(PlaceEntity.self)
    }
}
