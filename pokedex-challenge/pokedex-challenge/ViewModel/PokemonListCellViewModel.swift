//
//  PokemonListCellViewModel.swift
//  pokedex-challenge
//
//  Created by Hannah  on 19/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation

class PokemonListCellViewModel: ObservableObject {
    
    @Published var urlImage = String()
    @Published var name = String()
    @Published var id = 0
    @Published var pokemonListItem: PokemonListItem
    
    init(pokemonItem: PokemonListItem) {
        self.pokemonListItem = pokemonItem
        self.setId()
        self.setUrlImage()
        self.setName()
        self.setId()
    }
    
    fileprivate func setId(){
        if let id = pokemonListItem.id{
            self.id = Int(id) ?? 0
        }
    }
    
    fileprivate func setName(){
        name = pokemonListItem.name.capitalized
    }
    
    fileprivate func setUrlImage(){
        urlImage = pokemonListItem.urlImage ?? ""
    }
}
