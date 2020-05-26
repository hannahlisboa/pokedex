//
//  TypeDescription.swift
//  pokedex-challenge
//
//  Created by Hannah  on 25/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation

struct TypeDescription: Codable, Hashable {
    
    let name: String
    let pokemon: [TypesPokemon]
}

struct TypesPokemon: Codable, Hashable {
    let pokemon : Type
}
