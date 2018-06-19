//
//  MapConfigurator.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Swinject

struct SearchPlaceConfigurator {
    static func configureSearchPlaceScene(with container: Container) {
        container.storyboardInitCompleted(MapViewController.self) { (resolver, controller) in
            let presenter = MapPresenter()
            let router = MapRouter()
            
            presenter.view = controller
            
//            router.viewController = controller
            
            controller.presenter = presenter
            controller.router = router
        }
    }
}
