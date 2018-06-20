//
//  LocationFinderAPI.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Moya

enum LocationFinderAPI {
    case fetchPlace(String)
}

extension LocationFinderAPI: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("The URL could not be configured") }
        return url
    }
    
    var path: String {
        switch self {
        case .fetchPlace: return "maps/api/geocode/json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchPlace: return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .fetchPlace(let place):
            return .requestParameters(parameters: ["address": place, "sensor": false],
                                      encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

// MARK: - Enum helpers

extension LocationFinderAPI {
    private var environmentBaseURL: String {
        let environment = NetworkSettings.environment
        switch environment {
        case .production: return "https://maps.googleapis.com/"
        }
    }
}

