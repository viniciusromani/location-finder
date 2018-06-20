//
//  PlacesTableViewAdapter.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

protocol PlacesAdapterViewProtocol {
    func didSelectAll()
    func didSelect(place placeViewModel: PlaceViewModel)
}

final class PlacesTableViewAdapter: NSObject {
    var dataSet: [PlaceViewModel] = []
    var tableView: UITableView
    var viewDelegate: PlacesAdapterViewProtocol?
    
    init(tableView: UITableView, and viewDelegate: PlacesAdapterViewProtocol?) {
        self.tableView = tableView
        self.viewDelegate = viewDelegate
        super.init()
        
        setup(tableView: tableView)
    }
}

extension PlacesTableViewAdapter: TableViewProtocol {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.numberOfSection + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section == 0 else {
            return self.numberOfRows
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.section == 0 else {
            return dequeuePlacesCell(with: indexPath)
        }
        
        return dequeueAllPlacesCell(with: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 0 else {
            tableView.deselectRow(at: indexPath, animated: true)
            viewDelegate?.didSelect(place: model(for: indexPath))
            return
        }
        
        viewDelegate?.didSelectAll()
    }
}

extension PlacesTableViewAdapter: TableViewAdapter {
    typealias ModelType = PlaceViewModel
    
    func registerCell() {
        tableView.register(R.nib.placeTableViewCell)
    }
}

extension PlacesTableViewAdapter {
    
    private func dequeuePlacesCell(with indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = R.reuseIdentifier.placeTableViewCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) else {
            return UITableViewCell()
        }
        cell.configure(with: model(for: indexPath))
        return cell
    }
    
    private func dequeueAllPlacesCell(with indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = R.reuseIdentifier.placeTableViewCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) else {
            return UITableViewCell()
        }
        cell.configure(with: R.string.localizable.displayAll())
        return cell
    }
}

