//
//  PokemonDetailViewModel.swift
//  pokedex-challenge
//
//  Created by Hannah  on 20/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation
import SwiftUI

class PokemonDetailViewModel: ObservableObject {
    private var id: String
    var pokemon: Pokemon?
    @Published var isLoading = false
    @Published var showMsgError = false
    @Published var color = Color.white
    init(id:String) {
        self.id = id
    }
    
    func setColor(){
        if let poke = pokemon{
            if let mainType = poke.types.first {
                color = Types.Pokemon(rawValue: mainType.type.name)!.color
            }
        }
        
    }
    
    func fetchPokemon(){
        
        if (isLoading){
            return
        }
        isLoading = true
        
        let provider = NetworkManager()
        provider.getPokemon(id: id) { (result) in
            self.isLoading = false
            switch result{
            case.success(let pokemonsResult):
                self.showMsgError = false
                self.pokemon = pokemonsResult
                self.setColor()
            case .failure(let error):
                self.showMsgError = true
                print("Error", error)
            }
        }
        
    }
}
