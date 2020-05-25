//
//  ProfileViewModel.swift
//  pokedex-challenge
//
//  Created by Hannah  on 25/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation
import SwiftUI
class ProfileViewModel: ObservableObject {
    var pokemon: Pokemon?
    @Published var abilities = [PokeAbility]()
    @Published var urlImages = [String]()
    @Published var color = Color.black
    
    
    init(pokemon: Pokemon?, color: Color) {
        self.pokemon = pokemon
        self.color = color
        self.setAbilitys()
        self.loadImages()
    }
    
    fileprivate func setAbilitys(){
        if let poke = pokemon{
            abilities = poke.abilities
        }
    }
    
    fileprivate func loadImages(){
        if let poke = pokemon{
            let sprites = poke.sprites
            if let frontDefault = sprites.frontDefault{
                urlImages.append(frontDefault)
            }
            if let backDefault = sprites.backDefault{
                urlImages.append(backDefault)
            }
            if let frontShiny = sprites.frontShiny{
                urlImages.append(frontShiny)
            }
            if let backShiny = sprites.backShiny{
                urlImages.append(backShiny)
            }
            if let frontFemale = sprites.frontFemale{
                urlImages.append(frontFemale)
            }
            if let backFemale = sprites.backFemale{
                urlImages.append(backFemale)
            }
            if let frontShinyFemale = sprites.frontShinyFemale{
                urlImages.append(frontShinyFemale)
            }
            if let backShinyFemale = sprites.backShinyFemale{
                urlImages.append(backShinyFemale)
            }
        }
        
    }
}
