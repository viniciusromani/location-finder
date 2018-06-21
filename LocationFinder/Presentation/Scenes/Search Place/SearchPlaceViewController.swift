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
    
    func display(viewModel placesViewModel: [[PlaceViewModel]])
}

class SearchPlaceViewController: UIViewController, LoadableView, ControllableView {
    
    // Protocol conformance
    
    var presenter: SearchPlacePresenterProtocol!
    var router: SearchPlaceRouterProtocol!
    
    // TableView Adapter
    
    lazy var adapter = PlacesTableViewAdapter(tableView: placesTableView, and: self)
    
    // IBOutlets
    
    @IBOutlet weak var placeSearchBar: UISearchBar!
    @IBOutlet weak var placesTableView: UITableView!
    @IBOutlet weak var transparencyView: UIVisualEffectView!
    
    // View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showEmptyState(withMessage: R.string.localizable.emptyStateMessage_listScreen(), at: placesTableView)
        placeSearchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        hideNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        showNavigationBar()
    }
    
    // IBActions
    
    @IBAction func transparencyViewTouchedUpInside(_ sender: UITapGestureRecognizer) {
        placeSearchBar.resignFirstResponder()
        transparencyView.isHidden = true
    }
}

extension SearchPlaceViewController: SearchPlaceViewProtocol {
    
    func display(viewModel placesViewModel: [[PlaceViewModel]]) {
        hideActivityIndicatorView()
        adapter.setDataSet(placesViewModel)
    }
}

extension SearchPlaceViewController: PlacesAdapterViewProtocol {
    func didSelect(place placeViewModel: PlaceViewModel) {
        presenter.storeSelectedPlace(placeViewModel)
        router.navigateToMap()
    }
    
    func didSelectAll() {
        presenter.cleanSelectedPlace()
        router.navigateToMap()
    }
}

extension SearchPlaceViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        prepareToSearch()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        prepareToTriggerService()
        showActivityIndicatorView(at: placesTableView)
        presenter.fetchPlaces(with: searchBar.text)
    }
}

extension SearchPlaceViewController {
    private func prepareToSearch() {
        transparencyView.isHidden = false
    }
    
    private func prepareToTriggerService() {
        placeSearchBar.resignFirstResponder()
        hideEmptyState()
        transparencyView.isHidden = true
        adapter.clearData()
    }
}
