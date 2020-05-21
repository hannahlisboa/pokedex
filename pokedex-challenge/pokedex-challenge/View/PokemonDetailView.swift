//
//  PokemonDetailView.swift
//  pokedex-challenge
//
//  Created by Hannah  on 20/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

struct PokemonDetailView: View {
    var pokeItem: PokemonListItem
    @ObservedObject var pokemonDetailVM: PokemonDetailViewModel
    init(pokeItem: PokemonListItem) {
        self.pokeItem = pokeItem
        pokemonDetailVM = PokemonDetailViewModel(id: pokeItem.id!)
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                Text("")
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            LinearGradient(gradient: Gradient(colors: [pokemonDetailVM.color, .white]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).background(pokemonDetailVM.color)
                Spacer()
            }
            .background(LinearGradient(gradient: Gradient(colors: [pokemonDetailVM.color, .white]), startPoint: .top, endPoint: .bottom))
            .onAppear(){
                self.pokemonDetailVM.fetchPokemon()
                
            }
            NavigationBackButton(navigationTitle: "", navigationColor: Color.white)

        }
    }
}

//struct PokemonDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetailView(id: 10)
//    }
//}
