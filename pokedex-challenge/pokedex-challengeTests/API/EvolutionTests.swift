//
//  EvolutionTests.swift
//  pokedex-challengeTests
//
//  Created by Hannah  on 29/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import XCTest
@testable import pokedex_challenge
import Moya


class EvolutionTests: XCTestCase {
    
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
    
    func testEvolutionForIDSuccessReturnsEvolution() {
        
        let errorExpectation = expectation(description: "fetching evolution chain pokemon from API")
        
        var evolutionResponse:Evolution?
        
        provider = MoyaProvider<PokemonAPI>(endpointClosure: CustomEndPoint.successClosure, stubClosure: MoyaProvider.immediatelyStub)
        networkManager.provider = provider
        
        networkManager.getEvolution(id: "1") { (result) in
            
            switch result {
            case .success( let evolutionResult):
                evolutionResponse = evolutionResult
                errorExpectation.fulfill()
                
            case .failure( _):
                evolutionResponse = nil
                errorExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10) { (_) in
            XCTAssertNotNil(evolutionResponse, "error loading evolution chain pokemon for ID")
        }
    }
    func testGetEvolutionForIDWhenResponseErrorReturnsError() {
          
          let errorExpectation = expectation(description: "error request evolution chain pokemon from API")
          var errorResponse: Types.NetworkError?
          
          provider = MoyaProvider<PokemonAPI>(endpointClosure: CustomEndPoint.errorClosure, stubClosure: MoyaProvider.immediatelyStub)
          networkManager = NetworkManager()
          networkManager.provider = provider
          
          networkManager.getEvolution(id: "1") { (result) in

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
    func testGetEvolutionForIDEmptyDataReturnsError() {
           
           let errorExpectation = expectation(description: "error empty data from evolution chain pokemon for ID")
           var errorResponse: Types.NetworkError?
           
           provider = MoyaProvider<PokemonAPI>(endpointClosure: CustomEndPoint.emptyDataClosure, stubClosure: MoyaProvider.immediatelyStub)
           networkManager = NetworkManager()
           networkManager.provider = provider
           
           networkManager.getEvolution(id: "1") { (result) in
            
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
               XCTAssertNotNil(errorResponse, "Error Get Evolution for ID from API When return is Empty Data")
               
           }
       }
}
