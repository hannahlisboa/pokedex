//
//  TypeTests.swift
//  pokedex-challengeTests
//
//  Created by Hannah  on 29/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import XCTest
@testable import pokedex_challenge
import Moya

class TypeTests: XCTestCase {
    
    var provider: MoyaProvider<PokemonAPI>!
    var networkManager: NetworkManager!
    
    override func setUp() {
        super.setUp()
        networkManager = NetworkManager()
    }
    
    override func tearDown() {
        networkManager = nil
        super.tearDown()
    }
    
    func testTypeForIDSuccessReturnsTypeDescription() {
        
        let errorExpectation = expectation(description: "fetching pokemon type from API")
        
        var typeResponse:TypeDescription?
        
        provider = MoyaProvider<PokemonAPI>(endpointClosure: CustomEndPoint.successClosure, stubClosure: MoyaProvider.immediatelyStub)
        networkManager.provider = provider
        
        networkManager.getType(id: "1") { (result) in
            switch result {
            case .success( let typeResult):
                typeResponse = typeResult
                errorExpectation.fulfill()
                
            case .failure( _):
                typeResponse = nil
                errorExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10) { (_) in
            XCTAssertNotNil(typeResponse, "error loading pokemon type for ID")
        }
    }
    func testGetTypeForIDWhenResponseErrorReturnsError() {
        
        let errorExpectation = expectation(description: "error request pokemon type from API")
        var errorResponse: Types.NetworkError?
        
        provider = MoyaProvider<PokemonAPI>(endpointClosure: CustomEndPoint.errorClosure, stubClosure: MoyaProvider.immediatelyStub)
        networkManager = NetworkManager()
        networkManager.provider = provider
        
        networkManager.getType(id: "1") { (result) in
            
            switch result {
            case .success( _):
                errorResponse = nil
                errorExpectation.fulfill()
                
            case .failure(let error):
                errorResponse = error
                errorExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 1) { (_) in
            XCTAssertNotNil(errorResponse, "unhandled API error")
            
        }
    }
    func testGetTypeForIDEmptyDataReturnsError() {
        
        let errorExpectation = expectation(description: "error empty data from pokemon type for ID")
        var errorResponse: Types.NetworkError?
        
        provider = MoyaProvider<PokemonAPI>(endpointClosure: CustomEndPoint.emptyDataClosure, stubClosure: MoyaProvider.immediatelyStub)
        networkManager = NetworkManager()
        networkManager.provider = provider
        
        networkManager.getType(id: "1") { (result) in
            
            switch result {
            case .success( _):
                errorResponse = nil
                errorExpectation.fulfill()
                
            case .failure(let error):
                errorResponse = error
                errorExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 1) { (_) in
            XCTAssertNotNil(errorResponse, "Error Get type for ID from API When return is Empty Data")
            
        }
    }
}
