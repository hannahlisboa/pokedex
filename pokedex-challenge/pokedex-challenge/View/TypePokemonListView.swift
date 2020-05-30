//
//  TypePokemonListView.swift
//  pokedex-challenge
//
//  Created by Hannah  on 25/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

struct TypePokemonListView: View {
    
    @EnvironmentObject var sheetState: SheetState
    @ObservedObject var typesVM: TypePokemonListViewModel
    
    init(id: String ) {
        typesVM = TypePokemonListViewModel(id: id)
    }
    
    func fetchData(){
        self.typesVM.fetchType()
    }
    
    var body: some View {
        ZStack {
            LoadingView(isShowing: typesVM.isLoading && typesVM.pokemonList.isEmpty , content: {
                List {
                    Section(header:
                        HStack{
                            Text(self.typesVM.title)
                                .textStyle(TypeDetailTitleStyle())
                                .accessibility(identifier: "typeTitle")
                                .padding(20)
                            Spacer()
                            Button(action: {
                                self.sheetState.showingDetail = false
                            }) {
                                Image(systemName: Constants.Design.Image.xmark)
                                    .foregroundColor(Color.white)
                            }.buttonStyle(PlainButtonStyle())
                            .accessibility(identifier: "closeButton")
                                .padding()
                            
                        }.background(self.typesVM.color)
                            .listRowInsets(EdgeInsets()))
                    {
                        ForEach(self.typesVM.pokemonList, id: \.self) { type in
                            PokemonTypeCellView(type: type.pokemon)
                        }
                    }
                }.onAppear(){
                    self.typesVM.fetchType()
                }
            })
            ErrorView(show: typesVM.showMsgError, tapView: self.fetchData)
        }.banner(data: Constants.Data.bannerDataConnection, show: self.$typesVM.networkConnectionError)
    }
}
