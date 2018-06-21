//
//  SearchPlacePresenter.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import RxSwift
import MapKit

protocol SearchPlacePresenterProtocol: class {
    var view: SearchPlaceViewProtocol! { get set }
    var places: [PlaceViewModel] { get set }
    var selectedPlace: PlaceViewModel? { get set }
    
    var fetchPlacesUseCase: FetchPlacesUseCase! { get set }
    
    func fetchPlaces(with placeName: String?)
    func storeSelectedPlace(_ place: PlaceViewModel)
    func cleanSelectedPlace()
}

class SearchPlacePresenter: SearchPlacePresenterProtocol {
    
    // Variables
    
    var disposeBag = DisposeBag()
    
    // Protocol conformance
    
    var view: SearchPlaceViewProtocol!
    var places: [PlaceViewModel] = []
    var selectedPlace: PlaceViewModel?
    var fetchPlacesUseCase: FetchPlacesUseCase!
    
    func fetchPlaces(with placeName: String?) {
        guard let place = placeName else { return }
        
        fetchPlacesUseCase.fetchPlaces(for: place).subscribe(onNext: { [weak self] (places) in
            
            guard let strongSelf = self else { return }
            let placesViewModel = PlaceViewModel.array(mapping: places)
            strongSelf.places = placesViewModel
            
            strongSelf.managePlacesViewModelArray(placesViewModel)
        }, onError: { [weak self] (error) in
            
            guard let strongSelf = self else { return }
            var message: String = ""
            switch error {
            case HTTPError.unreachable:
                message = R.string.localizable.connectionError()
            default:
                message = error.localizedDescription
            }
            
            strongSelf.view.displayEmptyState(withMessage: message)
            
        }).disposed(by: disposeBag)
    }
    
    func storeSelectedPlace(_ place: PlaceViewModel) {
        selectedPlace = place
    }
    
    func cleanSelectedPlace() {
        selectedPlace = nil
    }
}

extension SearchPlacePresenter {
    private func managePlacesViewModelArray(_ placesViewModel: [PlaceViewModel]) {
        let count = placesViewModel.count
        
        if count == 0 {
            displayNoResults()
            return
        } else if count == 1 {
            displayOneResult(placesViewModel)
            return
        } else {
            displayMoreThanOneResult(placesViewModel)
            return
        }
    }
    
    private func displayNoResults() {
        view.displayEmptyState(withMessage: R.string.localizable.noResults())
    }
    
    private func displayOneResult(_ placesViewModel: [PlaceViewModel]) {
        view.display(viewModel: [placesViewModel])
    }
    
    private func displayMoreThanOneResult(_ placesViewModel: [PlaceViewModel]) {
        let displayAll = PlaceViewModel(address: R.string.localizable.displayAll(),
                                        location: CLLocation(),
                                        latitude: "",
                                        longitude: "")
        view.display(viewModel: [[displayAll], placesViewModel])
    }
}

