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
    @Published var networkConnectionError = false
    @Published var loadingMore = false
    @Published var searchNotFound = false
    @Published var bannerData: BannerModifier.BannerData

    @Published var searchText: String = "" {
        didSet {
            self.search()
        }
    }
    
    init(){
        bannerData = BannerModifier.BannerData(title: "No Connection!", detail: "No internet connection was found. Please try again later.", type: .Error)
    }
    
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
                self.networkConnectionError = false
                
                for pokeItem in pokemonsResult.pokemonList {
                    let pokemonListItem = PokemonListItem(id:Helpers.getId(url: pokeItem.url),
                                                          name: pokeItem.name,
                                                          url: pokeItem.url,
                                                          urlImage: Helpers.getUrlImage(id: Helpers.getId(url: pokeItem.url)))
                    self.pokemons.append(pokemonListItem)
                }
                self.pokemonList = self.pokemons.chunked(into: 3)
                self.offSet +=  30
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
    func fetchLoadMore(row: Int) {
        if (row == self.pokemonList.count-1 && searchText.isEmpty){
            self.fetchPokemonList()
            loadingMore = true
        }else{
            loadingMore = false
        }
    }
    
    func search (){
        
        pokemonList = self.pokemons.filter {
            searchText.isEmpty ? true :( $0.name.lowercased().contains(searchText.lowercased()) || $0.url.split(separator: "/").last!.contains(searchText) )
            
        }.chunked(into: 3)
        
        if  let result = pokemonList.first{
            if (result.count == 0){
                searchNotFound = true
            }else{
                searchNotFound = false
            }
        }
    }
}
