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
import Toast_Swift

protocol MapScreenViewProtocol: class {
    var presenter: MapScreenPresenterProtocol! { get set }
    var router: MapScreenRouterProtocol! { get set }
    
    func display(places placesViewModel: [PlaceViewModel])
    func display(selectedPlace place: PlaceViewModel)
    func displayAllPlaces()
    func hideStorageBarButton()
    func displayBarButtonState(with title: String)
    func displayDeleteConfirmationAlert(with title: String, and message: String)
    func displayToast(with message: String)
}

class MapScreenViewController: UIViewController {
    
    // Protocol conformance
    
    var presenter: MapScreenPresenterProtocol!
    var router: MapScreenRouterProtocol!
    
    // MapView Adapter
    
    lazy var adapter = PlacesMapViewAdapter(mapView: mapView)
    
    // IBOutlets
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var storageBarButton: UIBarButtonItem!
    
    // IBActions
    
    @IBAction func storageButtonTouchedUpInside(_ sender: UIBarButtonItem) {
        presenter.storageButtonTouched()
    }
    
    // View life cycle
    
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
    
    func hideStorageBarButton() {
        hideRightBarButtonItem()
    }
    
    func displayBarButtonState(with title: String) {
        storageBarButton.title = title
    }
    
    func displayDeleteConfirmationAlert(with title: String, and message: String) {
        let cancelAction: (UIAlertAction) -> Void = { action in }
        let deleteAction: (UIAlertAction) -> Void = { action in
            self.presenter.deletePlace()
        }
        let cancelActionTuple: AlertActionTuple = (title: R.string.localizable.defaultCancel(),
                                                   style: .cancel, handler: cancelAction)
        let deleteActionTuple: AlertActionTuple = (title: R.string.localizable.defaultDelete(),
                                                   style: .destructive, handler: deleteAction)
        
        let alertBuilder = SystemAlertBuilder().setTitle(title).setMessage(message).setActions(with: [cancelActionTuple, deleteActionTuple])
        let alert = alertBuilder.build()
        present(alert, animated: true)
    }
    
    func displayToast(with message: String) {
        view.makeToast(message)
    }
}

extension MapScreenViewController: PlacesAdapterMapViewProtocol { }

