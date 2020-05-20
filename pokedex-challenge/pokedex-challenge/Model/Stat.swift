//
//  Stat.swift
//  pokedex-challenge
//
//  Created by Hannah  on 20/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation


struct PokeStat:  Hashable, Codable {
    let baseStat: Int
    let effort: Int
    let stat: Stat
    
    enum CodingKeys: String, CodingKey {
        case effort
        case baseStat = "base_stat"
        case stat
    }
}

struct Stat: Hashable, Codable {
    let name: String
    let url: String
}
