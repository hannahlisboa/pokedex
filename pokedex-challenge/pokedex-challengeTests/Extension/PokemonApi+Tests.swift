//
//  PokemonApi+Tests.swift
//  pokedex-challengeTests
//
//  Created by Hannah  on 29/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation
@testable import pokedex_challenge

extension PokemonAPI {
    
    var testSampleData: Data {
        var dataUrl: URL?
        
        switch self {

        case .listPokemons:
            dataUrl = Bundle(for: ListPokemonTests.self).url(forResource: "ListPokemon", withExtension: "json")
            if let url = dataUrl, let data = try? Data(contentsOf: url) {
                debugPrint(data)
                return data
            }
        case .getPokemon:
            dataUrl = Bundle(for: ListPokemonTests.self).url(forResource: "Pokemon", withExtension: "json")
            if let url = dataUrl, let data = try? Data(contentsOf: url) {
                debugPrint(data)
                return data
            }
        case .getEvolution(id: let id):
            return Data()
        case .getSpecies(id: let id):
            return Data()
        case .getAbilityDescription(id: let id):
            return Data()
        case .getType(id: let id):
            return Data()
        }
        return Data()
    }
}
