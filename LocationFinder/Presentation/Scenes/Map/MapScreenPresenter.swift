//
//  MapScreenPresenter.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

protocol MapScreenPresenterProtocol: class {
    var view: MapScreenViewProtocol! { get set }
    
    var selectedPlace: PlaceViewModel? { get set }
}

class MapScreenPresenter: MapScreenPresenterProtocol {
    
    // Protocol conformance
    
    var view: MapScreenViewProtocol!
    var selectedPlace: PlaceViewModel?
    
    
}
