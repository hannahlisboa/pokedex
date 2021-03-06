//
//  PokemonApi+Tests.swift
//  pokedex-challengeTests
//
//  Created by Hannah  on 29/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation
@testable import pokedex

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
        case .getEvolution:
            dataUrl = Bundle(for: ListPokemonTests.self).url(forResource: "Evolution", withExtension: "json")
            if let url = dataUrl, let data = try? Data(contentsOf: url) {
                debugPrint(data)
                return data
            }
        case .getSpecies:
            dataUrl = Bundle(for: ListPokemonTests.self).url(forResource: "Specie", withExtension: "json")
            if let url = dataUrl, let data = try? Data(contentsOf: url) {
                debugPrint(data)
                return data
            }
        case .getAbilityDescription:
            dataUrl = Bundle(for: ListPokemonTests.self).url(forResource: "Ability", withExtension: "json")
            if let url = dataUrl, let data = try? Data(contentsOf: url) {
                debugPrint(data)
                return data
            }
        case .getType:
            dataUrl = Bundle(for: ListPokemonTests.self).url(forResource: "Type", withExtension: "json")
            if let url = dataUrl, let data = try? Data(contentsOf: url) {
                debugPrint(data)
                return data
            }
        }
        return Data()
    }
}
