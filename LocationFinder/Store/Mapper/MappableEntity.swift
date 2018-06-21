//
//  MappableEntity.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

protocol MappableEntity: Decodable {
    associatedtype Model
    
    init(mapping model: Model) throws
    init?(mapping model: Model?) throws
}
