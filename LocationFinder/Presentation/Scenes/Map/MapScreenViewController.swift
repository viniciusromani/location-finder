//
//  MapScreenViewController.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit
import UIKit

protocol MapScreenViewProtocol: class {
    var presenter: MapScreenPresenterProtocol! { get set }
    var router: MapScreenRouterProtocol! { get set }
    
    func display(places placesViewModel: [PlaceViewModel])
    func display(selectedPlace place: PlaceViewModel)
    func displayAllPlaces()
}

class MapScreenViewController: UIViewController {
    
    // Protocol conformance
    
    var presenter: MapScreenPresenterProtocol!
    var router: MapScreenRouterProtocol!
    
    // MapView Adapter
    
    lazy var adapter = PlacesMapViewAdapter(mapView: mapView)
    
    // IBOutlets
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.retrievePlaces()
        presenter.retrieveSelectedPlace()
    }
}

extension MapScreenViewController: MapScreenViewProtocol {
    
    func display(places placesViewModel: [PlaceViewModel]) {
        adapter.setDataSet(placesViewModel)
    }
    
    func display(selectedPlace place: PlaceViewModel) {
        adapter.centerOnLocation(place.location)
        adapter.showCallout(for: place.location)
    }
    
    func displayAllPlaces() {
        adapter.centerForAll()
    }
}

extension MapScreenViewController: PlacesAdapterMapViewProtocol {
    
}


