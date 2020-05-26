//
//  PokemonTypeCellViewViewModel.swift
//  pokedex-challenge
//
//  Created by Hannah  on 25/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation

class PokemonTypeCellViewModel: ObservableObject {
    var type: Type
    @Published var idPokemon = String()
    @Published var name = String()
    @Published var urlImage = String()

    init(type: Type) {
        self.type = type
        self.setId()
        self.setName()
        self.setUrlImage()
    }
    
    fileprivate func setUrlImage(){
        let id = Helpers.getId(url: type.url)
        urlImage = Helpers.getUrlImage(id: id)
    }
    
    fileprivate func setId(){
        idPokemon = "#" +  Helpers.getId(url: type.url)
    }

    fileprivate func setName(){
        name = type.name
       }
}
