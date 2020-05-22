//
//  Chain.swift
//  pokedex-challenge
//
//  Created by Hannah  on 22/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation

// MARK: - Chain
struct Chain: Codable, Hashable {
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
