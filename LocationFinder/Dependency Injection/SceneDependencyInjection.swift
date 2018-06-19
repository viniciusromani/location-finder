//
//  SceneDependencyInjection.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Swinject

struct SceneDependencyInjection {
    
    static func registerScenes(with container: Container) {
        SearchPlaceConfigurator.configureSearchPlaceScene(with: container)
    }
}
