//
//  TypePokemonListView.swift
//  pokedex-challenge
//
//  Created by Hannah  on 25/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

struct TypePokemonListView: View {
    
    @ObservedObject var typesVM: TypePokemonListViewModel
    
    init(id: String) {
        typesVM = TypePokemonListViewModel(id: id)
    }
    
    var body: some View {
        List {
            Section(header:
                HStack{
                    Text(typesVM.title).textStyle(PokemonNameDetailStyle()).padding(20)
                    Spacer()

                }.background(typesVM.color)
                    .listRowInsets(EdgeInsets()))
                {
                ForEach(typesVM.pokemonList, id: \.self) { type in
                    PokemonTypeCellView(type: type.pokemon)
                }
            }
        }.onAppear(){
            self.typesVM.fetchType()
        }
    }
}