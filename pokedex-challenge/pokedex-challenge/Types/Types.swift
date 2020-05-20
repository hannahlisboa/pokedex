//
//  Types.swift
//  pokedex-challenge
//
//  Created by Hannah  on 20/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation
import SwiftUI
struct Types {
    
    enum Image  {
        case gridCell
        case banner
    }
    enum Pokemon: String {
        case dark
        case dragon
        case electric
        case fairy
        case flying
        case fighting
        case fire
        case ghost
        case grass
        case ground
        case ice
        case normal
        case poison
        case psychic
        case rock
        case steel
        case water
        
        var color: Color {
            switch self {
            case .flying:
                return Color(Constants.Design.Color.PokemonTypeColors.flying)
            case .ghost:
                return Color(Constants.Design.Color.PokemonTypeColors.ghost)
                
            case .grass:
                return Color(Constants.Design.Color.PokemonTypeColors.grass)
                
            case .ground:
                return Color(Constants.Design.Color.PokemonTypeColors.ground)
                
            case .ice:
                return Color(Constants.Design.Color.PokemonTypeColors.ice)
            case .normal:
                return Color(Constants.Design.Color.PokemonTypeColors.normal)
                
            case .poison:
                return Color(Constants.Design.Color.PokemonTypeColors.poison)
                
            case .psychic:
                return Color(Constants.Design.Color.PokemonTypeColors.psychic)
                
            case .rock:
                return Color(Constants.Design.Color.PokemonTypeColors.rock)
                
            case .steel:
                return Color(Constants.Design.Color.PokemonTypeColors.steel)
                
            case .water:
                return Color(Constants.Design.Color.PokemonTypeColors.water)
                
            case .dark:
                return Color(Constants.Design.Color.PokemonTypeColors.dark)
                
            case .dragon:
                return Color(Constants.Design.Color.PokemonTypeColors.dragon)
                
            case .electric:
                return Color(Constants.Design.Color.PokemonTypeColors.electric)
                
            case .fairy:
                return Color(Constants.Design.Color.PokemonTypeColors.fairy)
                
            case .fighting:
                return Color(Constants.Design.Color.PokemonTypeColors.fighting)
                
            case .fire:
                return Color(Constants.Design.Color.PokemonTypeColors.fire)
                
            }
        }
    }
}
