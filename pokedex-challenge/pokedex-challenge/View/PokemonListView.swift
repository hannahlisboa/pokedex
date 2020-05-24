//
//  PokemonListView.swift
//  pokedex-challenge
//
//  Created by Hannah  on 19/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

struct PokemonListView: View {
    @ObservedObject var pokemonListVM: PokemonListViewModel
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        
        pokemonListVM = PokemonListViewModel()
        pokemonListVM.fetchPokemonList()
    }
    var body: some View {
        ZStack{
            LoadingView(isShowing: pokemonListVM.isLoading && !pokemonListVM.loadingMore , content: {
                List{
                    Section(header:  SearchBar(text: self.$pokemonListVM.searchText, placeholder: "search").listRowInsets(EdgeInsets())) {
                        
                        ForEach(0..<self.pokemonListVM.pokemonList.count, id: \.self) { indexRow in
                            VStack {
                                PokemonListRowView(pokemonListRow: self.pokemonListVM.pokemonList[indexRow])
                            }.listRowInsets(EdgeInsets())
                                .onAppear(){
                                    self.pokemonListVM.fetchLoadMore(row: indexRow)
                            }
                        }
                    }
                }
            })
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
