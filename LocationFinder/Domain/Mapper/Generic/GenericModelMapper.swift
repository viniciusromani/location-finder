//
//  GenericModelMapper.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

extension MappableModel {
    
    init(mapping entity: Entity) throws {
        try self.init(mapping: entity)
    }
    init?(mapping entity: Entity?) throws {
        guard let ent = entity else { return nil }
        try self.init(mapping: ent)
    }
    
    static func array(mapping entities: [Entity]) throws -> [Self] {
        return try entities.map { return try self.init(mapping: $0) }
    }
    static func array(mapping entities: [Entity]?) throws -> [Self]? {
        guard let ent = entities else { return nil }
        return try ent.map { return try self.init(mapping: $0) }
    }
}
