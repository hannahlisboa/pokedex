//
//  TypePokemonListViewModel.swift
//  pokedex-challenge
//
//  Created by Hannah  on 25/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation
import SwiftUI
class TypePokemonListViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var showMsgError = false
    @Published var pokemonList = [TypesPokemon]()
    @Published var title = String()
    @Published var color = Color.white

    var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func setColor(){
        self.color =  Types.Pokemon(rawValue: self.title)!.color

    }
    func fetchType(){
        
        if (isLoading){
            return
        }
        isLoading = true
        
        let provider = NetworkManager()
        provider.getType(id: id) { (result) in
            self.isLoading = false
            switch result{
            case.success(let typeResult):
                self.showMsgError = false
                self.pokemonList = typeResult.pokemon
                self.title = typeResult.name
                self.setColor()
            case .failure(let error):
                self.showMsgError = true
                print("Error", error)
            }
        }
        
    }
    
    
}
