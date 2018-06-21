//
//  TestableEntityMapper.swift
//  LocationFinderTests
//
//  Created by Vinicius Romani on 21/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Moya
import XCTest

protocol TestableEntityMapper where Self: XCTestCase {
    var localJSON: String { get set }
    var jsonData: Data { get }
    var response: Response { get }
}

extension TestableEntityMapper {
    var jsonData: Data {
        get {
            guard let path = Bundle(for: type(of: self)).url(forResource: localJSON, withExtension: "json") else {
                XCTFail("\(localJSON).json not found")
                fatalError("\(localJSON).json not found")
            }
            
            do {
                return try Data(contentsOf: path)
            } catch {
                XCTFail("\(localJSON).json not found")
                fatalError("\(localJSON).json could not be opened")
            }
        }
    }
    
    var response: Response {
        get {
            return Response(statusCode: 200, data: jsonData)
        }
    }
}
