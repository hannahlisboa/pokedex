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

struct NetworkManager: Network {
//    var provider = MoyaProvider<PokemonAPI>()
    let provider: MoyaProvider<PokemonAPI> = MoyaProvider<PokemonAPI>(plugins: [NetworkLoggerPlugin()])
    
}
