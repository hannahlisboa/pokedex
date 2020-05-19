//
//  NetworkManager.swift
//  pokedex-challenge
//
//  Created by Hannah  on 19/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Moya

protocol Network {
    associatedtype T: TargetType
    var provider: MoyaProvider<T> { get }
}

protocol NetworkManagerProtocol {
    
        func getPokemonList( completion: @escaping (GetPokemonList)->())
}

struct NetworkManager: Network {
    var provider = MoyaProvider<PokemonAPI>()
}
