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
    var deleteUseCase: DeletePlaceUseCase! { get set }
    
    var places: [PlaceViewModel] { get set }
    var selectedPlace: PlaceViewModel? { get set }
    
    func retrievePlaces()
    func retrieveSelectedPlace()
    
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
    var deleteUseCase: DeletePlaceUseCase!
    
    func retrievePlaces() {
        view.display(places: places)
    }
    
    func retrieveSelectedPlace() {
        persistButtonState(with: selectedPlace)
        
        guard let selected = selectedPlace else {
            self.view.displayAllPlaces()
            return
        }
        
        view.display(selectedPlace: selected)
    }
    
    func storageButtonTouched() {
        switch buttonState {
        case .save: savePlace()
        case .delete: displayDeleteConfirmationAlert()
        default: break
        }
    }
    
    func deletePlace() {
        guard let selected = selectedPlace else { return }
        var message: String
        if deleteUseCase.deletePlace(with: selected.location) {
            message = R.string.localizable.placeDeletedToast()
            persistButtonState(with: selected)
        } else {
            message = R.string.localizable.placeNotdeletedToast()
        }
        view.displayToast(with: message)
    }
}

extension MapScreenPresenter {
    private func persistButtonState(with place: PlaceViewModel?) {
        if let selected = place {
            if fetchUseCase.fetchPlace(with: selected.location) == nil {
                buttonState = .save
            } else {
                buttonState = .delete
            }
        } else {
            buttonState = .none
        }
        
        switch buttonState {
        case .none: view.hideStorageBarButton()
        case .save, .delete: view.displayBarButtonState(with: buttonState.rawValue)
        }
    }
    
    private func savePlace() {
        guard let selected = selectedPlace else { return }
        let placeModel = PlaceModel(address: selected.address, location: selected.location)
        
        var message: String
        if saveUseCase.save(placeModel: placeModel) {
            message = R.string.localizable.placeSavedToast()
            persistButtonState(with: selected)
        } else {
            message = R.string.localizable.placeNotsavedToast()
        }
        view.displayToast(with: message)
    }
    
    private func displayDeleteConfirmationAlert() {
        view.displayDeleteConfirmationAlert(with: R.string.localizable.alertDeleteTitle(selectedPlace?.address ?? ""),
                                            and: R.string.localizable.alertDeleteMessage())
    }
}
