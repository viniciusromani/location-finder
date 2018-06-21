//
//  RepositoryDependencyInjection.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Swinject

struct RepositoryDependencyInjection {
    
    static func registerRepositories(with container: Container) {
        container.register(GoogleRepository.self) { (resolver) -> GoogleRepository in
            return GoogleNetworkRepository()
        }
        
        container.register(CoreDataRepository.self) { (resolver) -> CoreDataRepository in
            return CoreDataLocalRepository()
        }
    }
}
