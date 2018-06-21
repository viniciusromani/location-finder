//
//  MapScreenConfigurator.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Swinject

struct MapScreenConfigurator {
    static func configureMapScreenScene(with container: Container) {
        container.storyboardInitCompleted(MapScreenViewController.self) { (resolver, controller) in
            let presenter = MapScreenPresenter()
            let router = MapScreenRouter()
            
            presenter.view = controller
            
            presenter.saveUseCase = resolver.resolve(SavePlaceUseCase.self)!
            presenter.fetchUseCase = resolver.resolve(FetchCoreDataPlacesUseCase.self)!
            presenter.deleteUseCase = resolver.resolve(DeletePlaceUseCase.self)!
            
            router.viewController = controller
            
            controller.presenter = presenter
            controller.router = router
        }
    }
}
