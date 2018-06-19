//
//  PlacesMapViewAdapter.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit
import MapKit

protocol PlacesAdapterMapViewProtocol {
    
}

final class PlacesMapViewAdapter: NSObject {
    var dataSet: [PlaceViewModel] = []
    var mapView: MKMapView
    var selectedAnnotation: MKAnnotation?
    
    init(mapView: MKMapView) {
        self.mapView = mapView
        super.init()
        
        setup(mapView: mapView)
    }
}

extension PlacesMapViewAdapter: MapViewProtocol {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        
        let reuseIdentifier = "mapViewPin"
        guard let pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) as? MKPinAnnotationView else {
            let pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
            pinView.canShowCallout = true
            pinView.animatesDrop = true
            return pinView
        }
        
        return pinView
    }
}

extension PlacesMapViewAdapter: MapViewAdapter {
    typealias ModelType = PlaceViewModel
    
    func setDataSet(_ viewModelArray: [PlaceViewModel]) {
        
        // For only one place
        
        guard viewModelArray.count > 1 else {
            guard let firstPlace = viewModelArray.first else { return }
            addAnnotation(at: firstPlace.location,
                          with: firstPlace.address,
                          and: "(\(firstPlace.latitude) \(firstPlace.longitude))")
            centerOnLocation(firstPlace.location)
            return
        }
        
        // For more places
        
        for viewModel in viewModelArray {
            addAnnotation(at: viewModel.location,
                          with: viewModel.address,
                          and: "(\(viewModel.latitude) \(viewModel.longitude))")
        }
    }
}
