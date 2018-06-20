//
//  TableViewAdapter.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import UIKit

// MARK: - TableViewDataSource and Delegate

typealias TableViewProtocol = UITableViewDelegate & UITableViewDataSource

// MARK: - TableViewAdapter Protocol

protocol TableViewAdapter: class {
    associatedtype ModelType
    var dataSet: [[ModelType]] { get set }
    var tableView: UITableView { get }
    func registerCell()
}

// MARK: - TableViewAdapter Helper Methods and Variables

extension TableViewAdapter where Self: TableViewProtocol {
    
    // MARK: - Variables
    
    var numberOfSection: Int { return dataSet.count }
    
    // MARK: - Helpers
    
    func setup(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
        registerCell()
    }
    
    func numberOfRows(in section: Int) -> Int {
        return dataSet[section].count
    }
    
    func setDataSet(_ newDataSet: [[ModelType]]) {
        dataSet = newDataSet
        tableView.reloadData()
    }
    
    func model(for indexPath: IndexPath) -> ModelType {
        let data = dataSet[indexPath.section]
        return data[indexPath.row]
    }
    
    func isLastSection(_ indexPath: IndexPath) -> Bool {
        guard let sections = numberOfSections?(in: tableView) else {
            return false
        }
        return sections == (indexPath.section + 1)
    }
    
    func isLastRow(_ indexPath: IndexPath) -> Bool {
        let numberOfRows = tableView(tableView, numberOfRowsInSection: indexPath.section)
        return numberOfRows == (indexPath.row + 1)
    }
}
