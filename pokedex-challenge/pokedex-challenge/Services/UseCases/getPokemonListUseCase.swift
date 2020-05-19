//
//  getPokemonListUseCase.swift
//  pokedex-challenge
//
//  Created by Hannah  on 19/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation
import Network
enum  GetPokemonListResult {
    case success(PokemonList)
    case failure(String)
}


typealias GetPokemonList = (GetPokemonListResult) -> Void

extension NetworkManager {
    
    func getPokemonList (offset:Int , completion: @escaping (GetPokemonListResult)->()){
        if Connectivity.isConnectedToInternet{
            provider.request(.listPokemons(offset: offset))  { result in
                switch result {
                case let .success(response):
                    do {
                        let results = try JSONDecoder().decode(PokemonList.self, from:
                            response.data)
                        
                        completion(.success(results))
                    } catch let error {
                        completion(.failure(error.localizedDescription))
                        print(error)
                    }
                case let .failure(error):
                    completion(.failure(error.localizedDescription))
                    print(error)
                }
            }
        }
    }
    
}

