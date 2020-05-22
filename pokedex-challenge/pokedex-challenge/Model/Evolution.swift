//
//  Evolution.swift
//  pokedex-challenge
//
//  Created by Hannah  on 21/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation

// MARK: - Evolution
struct Evolution: Codable {
    let chain: Chain
    let id: Int
}

struct EvolutionChain: Hashable, Codable {
    let url: String
}

// MARK: - EvolutionDetail
struct EvolutionDetail: Codable, Hashable {
    let minLevel: Int?
    let needsOverworldRain: Bool
    let timeOfDay: String
    let trigger: Species
    let turnUpsideDown: Bool
    
    enum CodingKeys: String, CodingKey {
        case minLevel = "min_level"
        case needsOverworldRain = "needs_overworld_rain"
        case timeOfDay = "time_of_day"
        case trigger
        case turnUpsideDown = "turn_upside_down"
    }
}

struct EvolutionNode: Codable, Hashable {
 
    let species: Species
    let evolutionTo: [Chain]
    
    init(species: Species, chains: [Chain]) {
        self.species = species
        self.evolutionTo = chains
    }
}
