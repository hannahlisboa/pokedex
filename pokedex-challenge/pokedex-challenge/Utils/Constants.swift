//
//  Constants.swift
//  pokedex-challenge
//
//  Created by Hannah  on 19/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation


struct Constants {
    
    struct API {
        static let pokeApiUrl = "https://pokeapi.co/api/v2/"
        static let baseImageURL = "https://pokeres.bastionbot.org/images/pokemon/"
        
    }
    struct Design {
        struct Color {
            static let Red = "mandy"
            static let Yellow = "corn"
            static let Blue = "azure"
            
            struct PokemonTypeColors{
                static let dark = "dark"
                static let dragon = "dragon"
                static let electric = "electric"
                static let fairy = "fairy"
                static let flying = "flying"
                static let fighting = "fighting"
                static let fire = "fire"
                static let ghost = "ghost"
                static let grass = "grass"
                static let ground = "ground"
                static let ice = "ice"
                static let normal = "normal"
                static let poison = "poison"
                static let psychic = "psychic"
                static let rock = "rock"
                static let steel = "steel"
                static let water = "water"
            }
            
        }
        struct Font {
            static let BrandFont = "PokemonSolidNormal"
            static let Title = "Lemoneign-Regular"
            static let SpecialItems = "HoboStd"
            
        }
    }
}

