//
//  CustomEndpoint.swift
//  pokedex-challengeTests
//
//  Created by Hannah  on 29/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation
@testable import pokedex
import Moya

struct CustomEndPoint {
    static let successClosure = { (target: PokemonAPI) -> Endpoint in
        return Endpoint(url: URL(target: target).absoluteString,
                        sampleResponseClosure: { .networkResponse(200, target.testSampleData) },
                        method: target.method,
                        task: target.task,
                        httpHeaderFields: target.headers)
    }
    
    static let errorClosure = { (target: PokemonAPI) -> Endpoint in
        let error = NSError(domain: "error", code: 1234, userInfo: nil)
        return Endpoint(url: URL(target: target).absoluteString,
                        sampleResponseClosure: { .networkError(error) },
                        method: target.method,
                        task: target.task,
                        httpHeaderFields: target.headers)
    }
    static let emptyDataClosure = { (target: PokemonAPI) -> Endpoint in
        let error = NSError(domain: "error", code: 1234, userInfo: nil)
        return Endpoint(url: URL(target: target).absoluteString,
                        sampleResponseClosure: { .networkResponse(401, Data()) },
                        method: target.method,
                        task: target.task,
                        httpHeaderFields: target.headers)
    }
}
