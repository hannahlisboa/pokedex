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
    @Binding var showingDetail: Bool
    
    init(id: String, showingDetail:Binding<Bool> ) {
        typesVM = TypePokemonListViewModel(id: id)
        self._showingDetail = showingDetail
    }
    
    var body: some View {
        List {
            Section(header:
                HStack{
                    Text(typesVM.title).textStyle(TypeDetailTitleStyle()).padding(20)
                    Spacer()
                    Button(action: {
                        self.showingDetail = false
                    }) {
                        Text("Done").foregroundColor(Color.white)
                    }.buttonStyle(PlainButtonStyle())
                        .padding()
                    
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
