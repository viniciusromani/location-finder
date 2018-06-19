//
//  MapPresenter.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

protocol MapPresenterProtocol: class {
    var view: MapViewProtocol! { get set }
}

class MapPresenter: MapPresenterProtocol {
    
    // Protocol conformance
    
    var view: MapViewProtocol!
}
