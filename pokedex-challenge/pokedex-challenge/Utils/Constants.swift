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
               
               
           }
           struct Font {
               static let BrandFont = "PokemonSolidNormal"
               static let Title = "Lemoneign-Regular"
               static let SpecialItems = "HoboStd"

           }
    }
    enum ImageType  {
           case gridCell
           case banner 
       }
}

