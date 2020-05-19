//
//  PokemonListViewModel.swift
//  pokedex-challenge
//
//  Created by Hannah  on 19/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    
    @Published var pokemonList = [[PokemonListItem]]()
    @Published var isLoading = false
    @Published var showMsgError = false
    @Published var loadingMore = false
    @Published var searchNotFound = false
    
   private var count = 0
   private var offSet = 0
   private var pokemons = [PokemonListItem]()
    
    func fetchPokemonList(){
        
        if (isLoading){
            return
        }
        
        if(count>0 && pokemons.count == count){
            return
        }
        isLoading = true
        
        let provider = NetworkManager()
        provider.getPokemonList(offset: offSet) { (result) in
            self.isLoading = false
            switch result{
            case.success(let pokemonsResult):
                self.showMsgError = false
                self.pokemons.append(contentsOf: pokemonsResult.pokemonList)
                self.pokemonList = self.pokemons.chunked(into: 2)
                self.offSet +=  20
            case .failure(let error):
                self.showMsgError = true
                print("Error", error)
            }
        }
        
    }
    func fetchLoadMore(row: Int) {
           if (row == self.pokemonList.count-1){
               self.fetchPokemonList()
               loadingMore = true
           }else{
               loadingMore = false
           }
       }
}
