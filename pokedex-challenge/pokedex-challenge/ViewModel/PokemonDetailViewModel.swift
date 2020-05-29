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
    @Published var pokemon: Pokemon?
    @Published var isLoading = false
    @Published var showMsgError = false
    @Published var urlImage = String()
    @Published var color = Color.white
    @Published var id = String()
    @Published var name = String()
    @Published var height = 0
    @Published var weight = 0
    @Published var ability = [PokeAbility]()
    @Published var stats = [PokeStat]()
    @Published var types = [Type]()
    @Published var networkConnectionError = false
    
    init(id:String) {
        self.id = id
    }
    
    fileprivate func loadValues(){
        self.setUrlImage()
        self.setColor()
        self.setName()
        self.setType()
        self.setHeight()
        self.setWeight()
        self.setStats()
    }
    
    fileprivate func setStats(){
        if let poke = pokemon {
            stats = poke.stats
        }
    }
    
    fileprivate func setHeight(){
        if let poke = pokemon {
            height = poke.height
        }
    }
    fileprivate func setWeight(){
        if let poke = pokemon {
            weight = poke.weight
        }
    }
    
    fileprivate func setType(){
        if let poke = pokemon {
            for pokeType in poke.types {
                types.append(pokeType.type)
            }
        }
    }
    
    fileprivate func setName(){
        if let poke = pokemon{
            name = poke.name
        }
    }
    
    fileprivate func setColor(){
        if let poke = pokemon{
            if let mainType = poke.types.first {
                color = Types.Pokemon(rawValue: mainType.type.name)!.color
            }
        }
    }
    
    fileprivate func setUrlImage(){
        urlImage = Constants.API.baseImageURL + String(pokemon!.id) + ".png"
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
                self.networkConnectionError = false
                self.showMsgError = false
                self.pokemon = pokemonsResult
                self.loadValues()
            case .failure(let error):
                switch error {
                case .decodingError, .requestFailed:
                    self.showMsgError = true
                case .noConnection:
                    DispatchQueue.main.async {
                        
                        self.networkConnectionError = true
                    }
                }
                print("Error", error)
            }
        }
        
    }
}
