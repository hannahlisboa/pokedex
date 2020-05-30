//
//  ListPokemonTests.swift
//  pokedex-challengeTests
//
//  Created by Hannah  on 29/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//
import XCTest
@testable import pokedex
import Moya


class ListPokemonTests: XCTestCase {
    
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
    func testGetListPokemonSuccessReturnsPokemonListItem() {
        
        let errorExpectation = expectation(description: "fetching pokemon list from API")
        
        var pokemonsResponse:[PokemonListItem]?
        
        provider = MoyaProvider<PokemonAPI>(endpointClosure: CustomEndPoint.successClosure, stubClosure: MoyaProvider.immediatelyStub)
        networkManager.provider = provider
        
        networkManager.getPokemonList(offset: 0) { (result) in
            
            switch result {
            case .success( let pokemonsResult):
                pokemonsResponse = pokemonsResult.pokemonList
                errorExpectation.fulfill()
                
            case .failure( _):
                pokemonsResponse = nil
                errorExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10) { (_) in
            XCTAssertNotNil(pokemonsResponse, "error loading pokemon list")
        }
    }
    
    func testGetListPokemonWhenResponseErrorReturnsError() {
        
        let errorExpectation = expectation(description: "error request Pokemon list from API")
        var errorResponse: Types.NetworkError?
        
        provider = MoyaProvider<PokemonAPI>(endpointClosure: CustomEndPoint.errorClosure, stubClosure: MoyaProvider.immediatelyStub)
        networkManager = NetworkManager()
        networkManager.provider = provider
        
        networkManager.getPokemonList(offset: 0) { (result) in
            
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
    
    func testGetListPokemonEmptyDataReturnsError() {
           
           let errorExpectation = expectation(description: "error empty data from Pokemon List")
           var errorResponse: Types.NetworkError?
           
        provider = MoyaProvider<PokemonAPI>(endpointClosure: CustomEndPoint.emptyDataClosure, stubClosure: MoyaProvider.immediatelyStub)
           networkManager = NetworkManager()
           networkManager.provider = provider
           
           networkManager.getPokemonList(offset: 0) { (result) in

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
               XCTAssertNotNil(errorResponse, "Error Get Pokemon List from API When return is Empty Data")
               
           }
       }
}
