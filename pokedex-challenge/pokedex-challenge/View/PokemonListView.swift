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
        self.fetchPokemons()
    }
    
    func fetchPokemons(){
        pokemonListVM.fetchPokemonList()
        
    }
    
    var body: some View {
        ZStack{
            LoadingView(isShowing: pokemonListVM.isLoading && pokemonListVM.pokemonList.isEmpty , content: {
                VStack {
                    SearchBar(text: self.$pokemonListVM.searchText, placeholder: Constants.Data.Strings.searchBarPlaceHolder)
                    List{
                        ForEach(0..<self.pokemonListVM.pokemonList.count, id: \.self) { indexRow in
                            VStack {
                                PokemonListRowView(pokemonListRow: self.pokemonListVM.pokemonList[indexRow])
                            }.listRowInsets(EdgeInsets())
                            .onAppear(){
                                self.pokemonListVM.fetchLoadMore(row: indexRow)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .background(Color.white)
                        HStack(){
                            Spacer()
                            ActivityIndicator(isAnimating: true, style: .medium)
                                .opacity(self.pokemonListVM.loadingMore ? 1.0 : 0.0)
                            Spacer()
                        }
                    }.listStyle(PlainListStyle())

                }
            })
            ErrorView(show: pokemonListVM.showMsgError, tapView: self.fetchPokemons)
            NotFoundView(show: pokemonListVM.searchNotFound && !pokemonListVM.showMsgError, searchText: pokemonListVM.searchText)
        }.banner(data: Constants.Data.bannerDataConnection, show: self.$pokemonListVM.networkConnectionError)
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
