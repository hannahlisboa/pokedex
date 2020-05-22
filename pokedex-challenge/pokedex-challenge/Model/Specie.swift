//
//  Specie.swift
//  pokedex-challenge
//
//  Created by Hannah  on 22/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation

struct Specie: Hashable, Codable {
  
    let name: String
    let id: Int
    let evolutionChain: EvolutionChain
    
    enum CodingKeys: String, CodingKey {
        case name
        case id
        case evolutionChain = "evolution_chain"
    }
}

struct EvolutionChain: Hashable, Codable {
    let url: String
}
