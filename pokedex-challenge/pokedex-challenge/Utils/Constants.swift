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
                static let bug = "bug"
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
        
        struct Image {
            static let chevronRight = "chevron.right.2"
            static let chevronLeft = "chevron.left"
            static let xmark = "xmark"
            static let magnifyingglass = "magnifyingglass"
        }
    }
    struct Data {
        static let bannerDataConnection = BannerModifier.BannerData(title: "No Connection!", detail: "No internet connection was found. Please try again later.", type: .Error)
        
        struct Strings {
            static let notEvolution = "This Pokémon does not evolve."
            static let searchBarPlaceHolder = "search"
            static let navBarTitleApplication = "Pokédex"
            static let height = "Height"
            static let weight = "Weight"
            static let metersUnit = "m"
            static let kilosUnit = "kg"
            static let abilitiesTitle = "ABILITIES"
            static let spritesTitle = "SPRITES"
            static let statsTitle = "STATS"
            static let evolutionsTitle = "EVOLUTIONS"
            static let profileTitle = "PROFILE"
            static let loadingText = "Loading..."
            static let genericError = "An error has occurred! \n Tap here to try again"
            static let sadText = ":("
            static func notFoundText(terms: String) -> String {
                return "No pokemon with \(terms.uppercased()) were found."
            }
        }
        
    }
}

