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
    
    init(pokemonItem: PokemonListItem) {
        self.pokeListCellVM = PokemonListCellViewModel(pokemonItem: pokemonItem)
    }
    var body: some View {
        ZStack(alignment: .topTrailing){
            Button(action: {
                self.showSheetView.toggle()
                
            }, label: {
                VStack(alignment: .center){
                    ImageViewComponent(url: pokeListCellVM.urlImage, type: .gridCell)
                    HStack{
                        Text("\(pokeListCellVM.id)")
                            .textStyle(IdCellStyle())
                        Text(pokeListCellVM.name)
                            .textStyle(TitleCellStyle())
                    }.padding(.bottom, 5)
                }
            }).buttonStyle(ButtonAnimatedStyle())
        }.padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 1)
            .sheet(isPresented: $showSheetView) {
                PokemonDetailView(id: self.pokeListCellVM.id)
        }
    }
}

struct SheetView: View {
    var body: some View {
        Text("Sheet View")
    }
}

