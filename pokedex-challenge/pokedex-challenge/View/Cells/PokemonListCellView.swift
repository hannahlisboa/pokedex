//
//  PokemonListCellView.swift
//  pokedex-challenge
//
//  Created by Hannah  on 19/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

struct PokemonListCellView: View {
    
    @ObservedObject var pokeListCellVM: PokemonListCellViewModel
    @State var showSheetView = false
    @State var selectionTAG: Int? = nil

    init(pokemonItem: PokemonListItem) {
        self.pokeListCellVM = PokemonListCellViewModel(pokemonItem: pokemonItem)
    }
    var body: some View {
        ZStack(alignment: .topTrailing){
            NavigationLink(destination: PokemonDetailView(pokeItem: self.pokeListCellVM.pokemonListItem)
                , tag: self.pokeListCellVM.id, selection: self.$selectionTAG, label: {
                          EmptyView()
                      })
                          .buttonStyle(PlainButtonStyle())
                          .frame(width: 0, height: 0)
                          .disabled(true)
                          .hidden()
                      
            Button(action: {
                self.selectionTAG = self.pokeListCellVM.id

            }, label: {
                VStack(alignment: .center){
                    ImageViewComponent(url: pokeListCellVM.urlImage, type: .gridCell)
                    VStack{
                        Text("#\(pokeListCellVM.id)")
                            .textStyle(IdCellStyle())
                        Text(pokeListCellVM.name)
                            .textStyle(TitleCellStyle())

                    }.padding(.bottom, 5)
                        .padding(.top, 10)
                        .frame(width: ImageSizeHelper.getSizeGridCell().width)
                }
            }).buttonStyle(ButtonAnimatedStyle())
        }.padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 1)
        
    }
}

struct SheetView: View {
    var body: some View {
        Text("Sheet View")
    }
}

