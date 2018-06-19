//
//  SearchPlaceConfigurator.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Swinject

struct MapConfigurator {
    static func configureMapScene(with container: Container) {
        container.storyboardInitCompleted(SearchPlaceViewController.self) { (resolver, controller) in
            let presenter = SearchPlacePresenter()
            let router = SearchPlaceRouter()
            
            presenter.view = controller
            presenter.fetchPlacesUseCase = resolver.resolve(FetchPlacesUseCase.self)!
            
            router.viewController = controller
            
            controller.presenter = presenter
            controller.router = router
        }
    }
}
