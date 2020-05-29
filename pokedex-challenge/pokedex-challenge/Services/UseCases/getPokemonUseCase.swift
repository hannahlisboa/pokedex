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
    case failure(Types.NetworkError)
}

extension NetworkManager {
    func getPokemon (id:String , completion: @escaping (GetPokemonResult)->()){
        let networkMonitor = NetworkConnectionMonitor()
        
        provider.request(.getPokemon(id: id)) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(Pokemon.self, from:
                        response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(.decodingError))
                    print(error)
                }
            case let .failure(error):
                if !networkMonitor.isConnected{
                    completion(.failure(.noConnection))
                    }
                    completion(.failure(.requestFailed))
                print(error)
            }
            
        }
        
    }
    
}
