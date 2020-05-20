//
//  Ability.swift
//  pokedex-challenge
//
//  Created by Hannah  on 20/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation


struct PokeAbility:  Hashable, Codable {
    let slot: Int
    let isHidden: Bool
    let ability: Ability
    
    enum CodingKeys: String, CodingKey {
        case slot
        case isHidden = "is_hidden"
        case ability
    }
}

struct Ability: Hashable, Codable{
    let name: String
    let url: String
}
