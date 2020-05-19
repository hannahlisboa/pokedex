//
//  PokemonAPI.swift
//  pokedex-challenge
//
//  Created by Hannah  on 19/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//
import Foundation
import Moya

enum PokemonAPI {
    case listPokemons(offset:Int)
}

extension PokemonAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Constants.API.pokeApiUrl) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self{
        case.listPokemons:
            return "pokemon"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .listPokemons(let offset):
            return .requestParameters(parameters: ["offset": offset], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}

