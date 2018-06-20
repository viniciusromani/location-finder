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
            
            guard placesViewModel.count > 1 else {
                strongSelf.view.display(viewModel: [placesViewModel])
                return
            }
            
            let displayAll = PlaceViewModel(address: R.string.localizable.displayAll(),
                                            location: CLLocation(),
                                            latitude: "",
                                            longitude: "")
            strongSelf.view.display(viewModel: [[displayAll], placesViewModel])
        }, onError: { (error) in
            
            print("error")
        }).disposed(by: disposeBag)
    }
    
    func storeSelectedPlace(_ place: PlaceViewModel) {
        selectedPlace = place
    }
    
    func cleanSelectedPlace() {
        selectedPlace = nil
    }
}
