//
//  MapViewAdapter.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import MapKit
import UIKit

// MARK: - MKMapViewDelegate

typealias MapViewProtocol = MKMapViewDelegate

// MARK: - MapViewAdapter Protocol

protocol MapViewAdapter: class {
    associatedtype ModelType
    var mapView: MKMapView { get }
    func setDataSet(_ viewModelArray: [ModelType])
}

// MARK: - MapViewAdapter Helper Methods and Variables

extension MapViewAdapter where Self: MapViewProtocol {
    func setup(mapView: MKMapView) {
        mapView.delegate = self
    }
    
    func addAnnotation(at location: CLLocation, with title: String? = nil, and subtitle: String? = nil) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                       longitude: location.coordinate.longitude)
        annotation.title = title
        annotation.subtitle = subtitle
        mapView.addAnnotation(annotation)
    }
    
    func centerOnLocation(_ location: CLLocation, using radius: Float = 1500000) {
        let distance = CLLocationDistance(radius)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  distance, distance)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func showCallout(for location: CLLocation) {
        
        for annotation in mapView.annotations {
            if annotation.coordinate == location.coordinate {
                mapView.selectAnnotation(annotation, animated: true)
                break
            }
        }
    }
    
    func centerForAll() {
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
}
