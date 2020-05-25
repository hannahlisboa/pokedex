//
//  AbilityDescription.swift
//  pokedex-challenge
//
//  Created by Hannah  on 25/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation

struct AbilityDescription: Codable, Hashable {
    
    let effectEntries: [EffectEntries]
    let name: String
    enum CodingKeys: String, CodingKey {
        case effectEntries = "effect_entries"
        case name
    }
    
}


struct  EffectEntries: Codable, Hashable {
    
    let effect: String
    let shortEffect: String
    
    enum CodingKeys: String, CodingKey {
        case effect
        case shortEffect = "short_effect"
    }
}
