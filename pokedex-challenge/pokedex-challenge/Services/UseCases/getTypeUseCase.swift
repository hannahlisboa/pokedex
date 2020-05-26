//
//  getAbilityUseCase.swift
//  pokedex-challenge
//
//  Created by Hannah  on 25/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation
import Network

enum  GetTypeResult {
    case success(TypeDescription)
    case failure(String)
}

extension NetworkManager {
    
    func getType(id:String , completion: @escaping (GetTypeResult)->()){
        provider.request(.getType(id: id
        )) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(TypeDescription.self, from:
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
