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
    
    var places: [PlaceViewModel] { get set }
    var selectedPlace: PlaceViewModel? { get set }
    
    func retrievePlaces()
    func retrieveSelectedPlace()
}

class MapScreenPresenter: MapScreenPresenterProtocol {
    
    // Protocol conformance
    
    var view: MapScreenViewProtocol!
    var places: [PlaceViewModel] = []
    var selectedPlace: PlaceViewModel?
    
    func retrievePlaces() {
        view.display(places: places)
    }
    
    func retrieveSelectedPlace() {
        guard let selected = selectedPlace else { return }
        view.display(selectedPlace: selected)
    }
}
