//
//  MapScreenPresenter.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation

enum StorageBarButtonState: String {
    case none = "None"
    case save = "Save"
    case delete = "Delete"
}

protocol MapScreenPresenterProtocol: class {
    var view: MapScreenViewProtocol! { get set }
    var buttonState: StorageBarButtonState { get set }
    
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
    var buttonState: StorageBarButtonState = .delete
    var places: [PlaceViewModel] = []
    var selectedPlace: PlaceViewModel?
    
    func retrievePlaces() {
        view.display(places: places)
    }
    
    func retrieveSelectedPlace() {
        guard let selected = selectedPlace else {
            self.view.displayAllPlaces()
            self.buttonState = .none
            return
        }
        
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
    private func savePlace() {
        print("delete")
    }
    
    private func displayDeleteConfirmationAlert() {
        view.displayDeleteConfirmationAlert(with: R.string.localizable.alertDeleteTitle(selectedPlace?.address ?? ""),
                                            and: R.string.localizable.alertDeleteMessage())
    }
}
