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
    var id: String?
    var urlImage: String?
    let name: String
    let url: String
    
    init(id: String, name: String, url: String, urlImage: String) {
        self.id = id
        self.name = name
        self.url = url
        self.urlImage = urlImage
    }
}
