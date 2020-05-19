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
        pokemonListVM = PokemonListViewModel()
        pokemonListVM.fetchPokemonList()
    }
    var body: some View {
        ZStack{
            List{
                ForEach(0..<self.pokemonListVM.pokemonList.count, id: \.self) { indexRow in
                    VStack {
                        
                        Text("\(indexRow): \(self.pokemonListVM.pokemonList[indexRow].name)")
                    }.listRowInsets(EdgeInsets())
                        .onAppear(){
                            self.pokemonListVM.fetchLoadMore(row: indexRow)
                    }
                }
            }
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
