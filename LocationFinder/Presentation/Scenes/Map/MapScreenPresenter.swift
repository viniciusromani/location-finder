//
//  MapScreenPresenter.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import MapKit

enum StorageBarButtonState: String {
    case none = "None"
    case save = "Save"
    case delete = "Delete"
}

protocol MapScreenPresenterProtocol: class {
    var view: MapScreenViewProtocol! { get set }
    var buttonState: StorageBarButtonState { get set }
    
    var saveUseCase: SavePlaceUseCase! { get set }
    var fetchUseCase: FetchCoreDataPlacesUseCase! { get set }
    
    var places: [PlaceViewModel] { get set }
    var selectedPlace: PlaceViewModel? { get set }
    
    func retrievePlaces()
    func retrieveSelectedPlace()
    func retrieveButtonState()
    
    func storageButtonTouched()
    func deletePlace()
}

class MapScreenPresenter: MapScreenPresenterProtocol {
    
    // Protocol conformance
    
    var view: MapScreenViewProtocol!
    var buttonState: StorageBarButtonState = .save
    var places: [PlaceViewModel] = []
    var selectedPlace: PlaceViewModel?
    
    var saveUseCase: SavePlaceUseCase!
    var fetchUseCase: FetchCoreDataPlacesUseCase!
    
    func retrievePlaces() {
        view.display(places: places)
    }
    
    func retrieveSelectedPlace() {
        guard let selected = selectedPlace else {
            self.view.displayAllPlaces()
            self.buttonState = .none
            return
        }
        
        persistButtonState(with: selected)
        view.display(selectedPlace: selected)
    }
    
    func retrieveButtonState() {
        guard buttonState != .none else {
            self.view.hideStorageBarButton()
            return
        }
        
        view.displayBarButtonState(with: buttonState.rawValue)
    }
    
    func storageButtonTouched() {
        switch buttonState {
        case .save: savePlace()
        case .delete: displayDeleteConfirmationAlert()
        default: break
        }
    }
    
    func deletePlace() {
        print("save")
    }
}

extension MapScreenPresenter {
    private func persistButtonState(with place: PlaceViewModel) {
        guard fetchUseCase.fetchPlace(with: place.location) != nil else {
            self.buttonState = .save
            return
        }
        
        buttonState = .delete
    }
    
    private func savePlace() {
        guard let selected = selectedPlace else { return }
        let placeModel = PlaceModel(address: selected.address, location: selected.location)
        saveUseCase.save(placeModel: placeModel)
    }
    
    private func displayDeleteConfirmationAlert() {
        view.displayDeleteConfirmationAlert(with: R.string.localizable.alertDeleteTitle(selectedPlace?.address ?? ""),
                                            and: R.string.localizable.alertDeleteMessage())
    }
}
