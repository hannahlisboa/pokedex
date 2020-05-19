//
//  PokemonList.swift
//  pokedex-challenge
//
//  Created by Hannah  on 19/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation

struct PokemonList:  Hashable, Codable {
    let count: Int
    let pokemonList: [PokemonListItem]
    
    enum CodingKeys: String, CodingKey {
        case count
        case pokemonList = "results"
    }
}

struct PokemonListItem: Hashable, Codable {
    let name: String
    let url: String
}