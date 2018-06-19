//
//  SearchPlaceRouter.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

protocol SearchPlaceRouterProtocol: class {
    var viewController: SearchPlaceViewController! { get set }
    
    func navigateToHistory()
}

class SearchPlaceRouter: SearchPlaceRouterProtocol {
    
    // Segue Identifier
    
    let navigateToMapIdentifier = R.segue.searchPlaceViewController.showMap
    
    // Protocol conformance
    
    var viewController: SearchPlaceViewController!
    
    func navigateToHistory() {
        viewController.performSegue(withIdentifier: navigateToMapIdentifier, sender: nil)
    }
}

extension SearchPlaceViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case R.segue.searchPlaceViewController.showMap.identifier:
            passDataToMap(segue, sender: sender)
        default: break
        }
    }
    
    func passDataToMap(_ segue: UIStoryboardSegue, sender: Any?) {
        guard let mapScene = R.segue.searchPlaceViewController.showMap(segue: segue) else {
            return
        }
        
        let mapViewController = mapScene.destination
//        historyViewController.presenter.matches = self.presenter.matches
    }
}
