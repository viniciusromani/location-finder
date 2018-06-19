//
//  SearchPlaceViewController.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

protocol SearchPlaceViewProtocol: class {
    var presenter: SearchPlacePresenterProtocol! { get set }
    var router: SearchPlaceRouterProtocol! { get set }
    
    func display(viewModel placesViewModel: [PlaceViewModel])
}

class SearchPlaceViewController: UIViewController {
    
    // Protocol conformance
    
    var presenter: SearchPlacePresenterProtocol!
    var router: SearchPlaceRouterProtocol!
    
    // TableView Adapter
    
    lazy var adapter = PlacesTableViewAdapter.init(tableView: placesTableView, and: self)
    
    // IBOutlets
    
    @IBOutlet weak var placeSearchBar: UISearchBar!
    @IBOutlet weak var placesTableView: UITableView!
    
    // View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.fetchPlaces(with: "XIT")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        hideNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        showNavigationBar()
    }
}

extension SearchPlaceViewController: SearchPlaceViewProtocol {
    
    func display(viewModel placesViewModel: [PlaceViewModel]) {
        adapter.setDataSet(placesViewModel)
    }
}

extension SearchPlaceViewController: PlacesAdapterViewProtocol {
    func didSelect(place placeViewModel: PlaceViewModel) {
        presenter.storeSelectedPlace(placeViewModel)
        router.navigateToMap()
    }
}

