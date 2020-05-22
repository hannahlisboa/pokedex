//
//  getEvolutionUseCase.swift
//  pokedex-challenge
//
//  Created by Hannah  on 21/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation
import Network

enum  GetEvolutionResult {
    case success(Evolution)
    case failure(String)
}

extension NetworkManager {
    
    func getEvolution (id:String , completion: @escaping (GetEvolutionResult)->()){
        provider.request(.getEvolution(id: id
        )) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(Evolution.self, from:
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
