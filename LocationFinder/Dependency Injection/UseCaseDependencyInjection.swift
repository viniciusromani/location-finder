//
//  UseCaseDependencyInjection.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Swinject

struct UseCaseDependencyInjection {
    
    static func registerUseCases(with container: Container) {
        container.register(FetchPlacesUseCase.self) { (resolver) -> FetchPlacesUseCase in
            return FetchPlacesUseCase(repository: resolver.resolve(GoogleRepository.self)!)
        }
    }
}
