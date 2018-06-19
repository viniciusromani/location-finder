//
//  ErrorCatcher.swift
//  LocationFinder
//
//  Created by Vinicius Romani on 19/06/18.
//  Copyright © 2018 Vinicius Romani. All rights reserved.
//

import Foundation
import Moya
import RxSwift

extension ObservableType where E == Response {
    
    func catchHTTPError() -> Observable<Response> {
        let mappedError = catchError { error -> Observable<Response> in
            switch error {
            case let urlError as URLError:
                guard let httpError = try? HTTPError(mapping: urlError)
                    else { return Observable.error(error) }
                return Observable.error(httpError)
            case let moyaError as MoyaError:
                guard let httpError = try? HTTPError(mapping: moyaError)
                    else { return Observable.error(error) }
                return Observable.error(httpError)
            default:
                return Observable.error(error)
            }
        }
        return mappedError
    }
}
