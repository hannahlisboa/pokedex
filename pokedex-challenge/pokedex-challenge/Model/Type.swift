//
//  Type.swift
//  pokedex-challenge
//
//  Created by Hannah  on 20/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation

struct PokeType: Hashable, Codable {
    let slot: Int
    let type: Type
}
struct Type: Hashable, Codable {
    let name: String
    let url: String
}
