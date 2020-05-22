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

// MARK: - Chain
struct Chain: Codable {
    let evolutionDetails: [EvolutionDetail]
    let evolvesTo: [Chain]
    let isBaby: Bool
    let species: Species
    
    enum CodingKeys: String, CodingKey {
        case evolutionDetails = "evolution_details"
        case evolvesTo = "evolves_to"
        case isBaby = "is_baby"
        case species
    }
}

// MARK: - EvolutionDetail
struct EvolutionDetail: Codable {
    let minLevel: Int
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

// MARK: - Species
struct Species: Codable {
    let name: String
    let url: String
}

struct EvolutionNode: Codable, Hashable {
    let name: String
    let id: String
    let level: Int
    
    init(chain: Chain) {
        name = chain.species.name
        id = Helpers.getId(item: chain.species.url)
        if  chain.evolutionDetails.count > 0{
            level = chain.evolutionDetails.first!.minLevel
        }else{
            level = 0
        }
    }
}

