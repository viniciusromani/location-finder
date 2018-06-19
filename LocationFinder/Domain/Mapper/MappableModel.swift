//
//  MappableModel.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

protocol MappableModel {
    associatedtype Entity: MappableEntity
    
    init(mapping entity: Entity) throws
    init?(mapping entity: Entity?) throws
    static func array(mapping entities: [Entity]) throws -> [Self]
    static func array(mapping entities: [Entity]?) throws -> [Self]?
}
