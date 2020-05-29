//
//  SpecieTests.swift
//  pokedex-challengeTests
//
//  Created by Hannah  on 29/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import XCTest
@testable import pokedex_challenge
import Moya

class SpecieTests: XCTestCase {
    
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
    
    func testSpecieForIDSuccessReturnsSpecie() {
          
          let errorExpectation = expectation(description: "fetching pokemon specie from API")
          
          var specieResponse:Specie?
          
          provider = MoyaProvider<PokemonAPI>(endpointClosure: CustomEndPoint.successClosure, stubClosure: MoyaProvider.immediatelyStub)
          networkManager.provider = provider
          
          networkManager.getSpecie(id: "1") { (result) in
              
              switch result {
              case .success( let specieResult):
                  specieResponse = specieResult
                  errorExpectation.fulfill()
                  
              case .failure( _):
                  specieResponse = nil
                  errorExpectation.fulfill()
              }
          }
          
          waitForExpectations(timeout: 10) { (_) in
              XCTAssertNotNil(specieResponse, "error loading pokemon specie for ID")
          }
      }
    
    func testGetSpecieForIDWhenResponseErrorReturnsError() {
          
          let errorExpectation = expectation(description: "error request pokemon specie from API")
          var errorResponse: Types.NetworkError?
          
          provider = MoyaProvider<PokemonAPI>(endpointClosure: CustomEndPoint.errorClosure, stubClosure: MoyaProvider.immediatelyStub)
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
              XCTAssertNotNil(errorResponse, "unhandled API error")
              
          }
      }
    func testGetSpecieForIDEmptyDataReturnsError() {
             
             let errorExpectation = expectation(description: "error empty data from evolution chain pokemon for ID")
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
                 XCTAssertNotNil(errorResponse, "Error Get Evolution for ID from API When return is Empty Data")
                 
             }
         }

}
