//
//  DependencyInjectionTests.swift
//  LocationFinderTests
//
//  Created by Vinicius Romani on 21/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import XCTest
@testable import LocationFinder

class DependencyInjectionTests: XCTestCase {
    func testSearchScreenConfigurator() {
        let searchViewController = instantiateSearchViewController()
        XCTAssert(searchViewController != nil)
        XCTAssert(searchViewController?.presenter != nil)
        XCTAssert(searchViewController?.router != nil)
        
        let presenter = searchViewController?.presenter
        XCTAssert(presenter?.view != nil)
        XCTAssert(presenter?.fetchPlacesUseCase != nil)
        
        let router = searchViewController?.router
        XCTAssert(router?.viewController != nil)
    }
    
    func testHistoryScreenConfigurator() {
        let mapViewController = instantiateMapViewController()
        XCTAssert(mapViewController != nil)
        XCTAssert(mapViewController?.presenter != nil)
        XCTAssert(mapViewController?.router != nil)
        
        let presenter = mapViewController?.presenter
        XCTAssert(presenter?.view != nil)
        XCTAssert(presenter?.saveUseCase != nil)
        XCTAssert(presenter?.fetchUseCase != nil)
        XCTAssert(presenter?.deleteUseCase != nil)
        
        let router = mapViewController?.router
        XCTAssert(router?.viewController != nil)
    }
}

extension DependencyInjectionTests {
    private func instantiateSearchViewController() -> SearchPlaceViewController? {
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController
        return navigationController?.topViewController as? SearchPlaceViewController
    }
    
    private func instantiateMapViewController() -> MapScreenViewController? {
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "MapScreenViewController") as? MapScreenViewController
    }
}
