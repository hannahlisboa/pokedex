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
    case failure(Types.NetworkError)
}

extension NetworkManager {
    
    func getPokemonList (offset:Int , completion: @escaping (GetPokemonListResult)->()){
        
         let networkMonitor = NetworkConnectionMonitor()

            provider.request(.listPokemons(offset: offset))  { result in
                switch result {
                case let .success(response):
                    do {
                        let results = try JSONDecoder().decode(PokemonList.self, from:
                            response.data)
                        
                        completion(.success(results))
                    } catch let error {
                        completion(.failure(.decodingError))
                        print(error)
                    }
                case let .failure(error):
                    if !networkMonitor.isConnected{
                        completion(.failure(.noConnection))
                    }else{
                        completion(.failure(.requestFailed))
                    }
                    print(error)
                }
            }
    }
    
}

