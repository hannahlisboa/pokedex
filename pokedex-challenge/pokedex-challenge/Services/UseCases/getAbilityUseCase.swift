//
//  getAbilityUseCase.swift
//  pokedex-challenge
//
//  Created by Hannah  on 25/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation
import Network

enum  GetAbilityDescriptionResult {
    case success(AbilityDescription)
    case failure(String)
}

extension NetworkManager {
    
    func getAbilityDescription (id:String , completion: @escaping (GetAbilityDescriptionResult)->()){
        provider.request(.getAbilityDescription(id: id
        )) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(AbilityDescription.self, from:
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
