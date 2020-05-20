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
    @Published var id = String()
    
    private var pokemonListItem: PokemonListItem
    init(pokemonItem: PokemonListItem) {
        self.pokemonListItem = pokemonItem
        self.setId()
        self.setUrlImage()
        self.setName()
    }
    
    fileprivate func setId(){
        let splitArray =  pokemonListItem.url.split(separator: "/")
        if let id = splitArray.last{
            self.id = String(id)
        }
    }
    
    fileprivate func setName(){
        name = pokemonListItem.name.capitalized
    }
    
    fileprivate func setUrlImage(){
        let url = Constants.API.baseImageURL + id + ".png"
        urlImage = url
        print("URL - - ", url)
        
    }
}
