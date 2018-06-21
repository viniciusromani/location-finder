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
        
        container.register(SavePlaceUseCase.self) { (resolver) -> SavePlaceUseCase in
            return SavePlaceUseCase(repository: resolver.resolve(CoreDataRepository.self)!)
        }
        
        container.register(FetchCoreDataPlacesUseCase.self) { (resolver) -> FetchCoreDataPlacesUseCase in
            return FetchCoreDataPlacesUseCase(repository: resolver.resolve(CoreDataRepository.self)!)
        }
    }
}
