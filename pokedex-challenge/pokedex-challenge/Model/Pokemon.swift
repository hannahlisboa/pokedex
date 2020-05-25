//
//  Pokemon.swift
//  pokedex-challenge
//
//  Created by Hannah  on 19/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation

struct Pokemon: Hashable, Codable {
  
    let id: Int
    let name: String
    let baseExperience: Int
    let height: Int
    let weight: Int
    let isDefault: Bool
    let locationAreaEncounters: String
    let order: Int
    let stats: [PokeStat]
    let abilities: [PokeAbility]
    let types: [PokeType]
    let sprites: Sprit
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case baseExperience = "base_experience"
        case height
        case weight
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case order
        case types
        case stats
        case abilities
        case sprites = "sprites"
    }
    
}
