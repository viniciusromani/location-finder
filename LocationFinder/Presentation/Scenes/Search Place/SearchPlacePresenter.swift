//
//  SearchPlacePresenter.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import RxSwift

protocol SearchPlacePresenterProtocol: class {
    var view: SearchPlaceViewProtocol! { get set }
    
    var fetchPlacesUseCase: FetchPlacesUseCase! { get set }
    
    func fetchPlaces(with placeName: String?)
}

class SearchPlacePresenter: SearchPlacePresenterProtocol {
    
    // Variables
    
    var disposeBag = DisposeBag()
    
    // Protocol conformance
    
    var view: SearchPlaceViewProtocol!
    var fetchPlacesUseCase: FetchPlacesUseCase!
    
    func fetchPlaces(with placeName: String?) {
        guard let place = placeName else { return }
        
        fetchPlacesUseCase.fetchPlaces(for: place).subscribe(onNext: { [weak self] (places) in
            
            guard let strongSelf = self else { return }
            let placesViewModel = PlaceViewModel.array(mapping: places)
            strongSelf.view.display(viewModel: placesViewModel)
        }, onError: { (error) in
            
            print("error")
        }).disposed(by: disposeBag)
    }
}
