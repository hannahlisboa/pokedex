//
//  getSpecieUseCase.swift
//  pokedex-challenge
//
//  Created by Hannah  on 22/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation
import Network

enum  GetSpecieResult {
    case success(Specie)
    case failure(Types.NetworkError)
}

extension NetworkManager {
    
    func getSpecie (id:String , completion: @escaping (GetSpecieResult)->()){
        let networkMonitor = NetworkConnectionMonitor()
        
        provider.request(.getSpecies(id: id)) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(Specie.self, from:
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
