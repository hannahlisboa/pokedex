//
//  Ability.swift
//  pokedex-challengeTests
//
//  Created by Hannah  on 29/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import XCTest
@testable import pokedex
import Moya

class AbilityTests: XCTestCase {
    
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
    
    func testAbilityForIDSuccessReturnsAbility() {
        
        let errorExpectation = expectation(description: "fetching pokemon ability description from API")
        
        var abilityResponse:AbilityDescription?
        
        provider = MoyaProvider<PokemonAPI>(endpointClosure: CustomEndPoint.successClosure, stubClosure: MoyaProvider.immediatelyStub)
        networkManager.provider = provider
        
        networkManager.getAbilityDescription(id: "1") { (result) in
            switch result {
            case .success( let abilityResult):
                abilityResponse = abilityResult
                errorExpectation.fulfill()
                
            case .failure( _):
                abilityResponse = nil
                errorExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10) { (_) in
            XCTAssertNotNil(abilityResponse, "error loading pokemon ability for ID")
        }
    }
    
    func testGetAbilityForIDWhenResponseErrorReturnsError() {
        
        let errorExpectation = expectation(description: "error request pokemon ability description from API")
        var errorResponse: Types.NetworkError?
        
        provider = MoyaProvider<PokemonAPI>(endpointClosure: CustomEndPoint.errorClosure, stubClosure: MoyaProvider.immediatelyStub)
        networkManager = NetworkManager()
        networkManager.provider = provider
        
        networkManager.getAbilityDescription(id: "1") { (result) in

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
    
    func testGetAbilityForIDEmptyDataReturnsError() {
                
                let errorExpectation = expectation(description: "error empty data from pokemon ability description for ID")
                var errorResponse: Types.NetworkError?
                
                provider = MoyaProvider<PokemonAPI>(endpointClosure: CustomEndPoint.emptyDataClosure, stubClosure: MoyaProvider.immediatelyStub)
                networkManager = NetworkManager()
                networkManager.provider = provider
                
                networkManager.getSpecie(id: "1") { (result) in

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
                    XCTAssertNotNil(errorResponse, "Error Get ability description for ID from API When return is Empty Data")
                    
                }
            }
}
