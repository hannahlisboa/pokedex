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
    case getPokemon(id: String)
    case getEvolution(id: String)
    case getSpecies(id: String)
    case getAbilityDescription(id: String)
    case getType(id: String)


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
        case .getPokemon(let id):
            return "pokemon/\(id)"
        case .getEvolution( let id):
            return "evolution-chain/\(id)"
        case .getSpecies(let id):
            return "pokemon-species/\(id)"
        case .getAbilityDescription(let id):
            return "ability/\(id)"
        case .getType(let id):
            return "type/\(id)"
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
            return .requestParameters(parameters: ["offset": offset, "limit": 30], encoding: URLEncoding.queryString)
        case .getPokemon, .getEvolution, .getSpecies, .getAbilityDescription, .getType:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}


