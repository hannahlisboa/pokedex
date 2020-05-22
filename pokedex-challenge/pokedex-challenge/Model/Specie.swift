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

// MARK: - Species
struct Species: Codable, Hashable {
    let name: String
    let url: String
}
