//
//  GenericEntityMapper.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Moya
import RxSwift

extension ObservableType where E == Response {
    
    func mapEntity<Entity: MappableEntity>(_ type: Entity.Type) -> Observable<Entity> {
        let mappedEntity = flatMap { response -> Observable<Entity> in
            guard let entity = try? JSONDecoder().decode(Entity.self, from: response.data) else {
                return Observable.error(MapperError.cannotMapToEntity)
            }
            return Observable.just(entity)
        }
        return mappedEntity
    }
}

extension ObservableType where E == Response {
    
    func mapEntities<Entity: MappableEntity>(_ type: Entity.Type) -> Observable<[Entity]> {
        let mappedEntities = flatMap { response -> Observable<[Entity]> in
            guard let entities = try? JSONDecoder().decode([String: [Entity]].self, from: response.data) else {
                return Observable.error(MapperError.cannotMapToEntity)
            }
            return Observable.just(entities["results"]!)
        }
        return mappedEntities
    }
}
