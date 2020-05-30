//
//  PokemonIdTests.swift
//  pokedex-challengeTests
//
//  Created by Hannah  on 29/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import XCTest
@testable import pokedex
import Moya


class PokemonIdTests: XCTestCase {
    
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
    
    func testGetPokemonForIDSuccessReturnsPokemon() {
        
        let errorExpectation = expectation(description: "fetching pokemon for ID from API")
        
        var pokemonsResponse:Pokemon?
        
        provider = MoyaProvider<PokemonAPI>(endpointClosure: CustomEndPoint.successClosure, stubClosure: MoyaProvider.immediatelyStub)
        networkManager.provider = provider
        
        networkManager.getPokemon(id: "1") { (result) in
            
            switch result {
            case .success( let pokemonsResult):
                pokemonsResponse = pokemonsResult
                errorExpectation.fulfill()
                
            case .failure( _):
                pokemonsResponse = nil
                errorExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10) { (_) in
            XCTAssertNotNil(pokemonsResponse, "error loading pokemon for ID")
        }
    }
    func testGetPokemonForIDWhenResponseErrorReturnsError() {
        
        let errorExpectation = expectation(description: "error request Pokemon for ID from API")
        var errorResponse: Types.NetworkError?
        
        provider = MoyaProvider<PokemonAPI>(endpointClosure: CustomEndPoint.errorClosure, stubClosure: MoyaProvider.immediatelyStub)
        networkManager = NetworkManager()
        networkManager.provider = provider
        
        networkManager.getPokemon(id: "1") { (result) in
            
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
    func testGetPokemonForIDEmptyDataReturnsError() {
        
        let errorExpectation = expectation(description: "error empty data from Pokemon for ID")
        var errorResponse: Types.NetworkError?
        
        provider = MoyaProvider<PokemonAPI>(endpointClosure: CustomEndPoint.emptyDataClosure, stubClosure: MoyaProvider.immediatelyStub)
        networkManager = NetworkManager()
        networkManager.provider = provider
        
        networkManager.getPokemon(id: "1") { (result) in

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
            XCTAssertNotNil(errorResponse, "Error Get Pokemon for ID from API When return is Empty Data")
            
        }
    }
}
