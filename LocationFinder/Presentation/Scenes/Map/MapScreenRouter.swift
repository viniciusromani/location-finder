//
//  MapScreenRouter.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

protocol MapScreenRouterProtocol: class {
    var viewController: MapScreenViewController! { get set }
}

class MapScreenRouter: MapScreenRouterProtocol {
    var viewController: MapScreenViewController!
}
