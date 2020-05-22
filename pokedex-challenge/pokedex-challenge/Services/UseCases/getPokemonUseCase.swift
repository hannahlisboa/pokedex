//
//  getPokemonUseCase.swift
//  pokedex-challenge
//
//  Created by Hannah  on 20/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation
import Network

enum  GetPokemonResult {
    case success(Pokemon)
    case failure(String)
}

extension NetworkManager {
    func getPokemon (id:String , completion: @escaping (GetPokemonResult)->()){
        if Connectivity.isConnectedToInternet{
            provider.request(.getPokemon(id: id)) { result in
                switch result {
                case let .success(response):
                    do {
                        let results = try JSONDecoder().decode(Pokemon.self, from:
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
