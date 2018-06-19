//
//  MapViewController.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

protocol MapViewProtocol: class {
    var presenter: MapPresenterProtocol! { get set }
    var router: MapRouterProtocol! { get set }
}

class MapViewController: UIViewController {
    
    // Protocol conformance
    
    var presenter: MapPresenterProtocol!
    var router: MapRouterProtocol!
}

extension MapViewController: MapViewProtocol {
    
}
