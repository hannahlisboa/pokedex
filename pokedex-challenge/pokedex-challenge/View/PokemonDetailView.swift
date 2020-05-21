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
    @State private var selected = 0
    
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
                HStack{
                    Spacer()
                    VStack{
                        VStack{
                            Text("# \(pokemonDetailVM.id)")
                                .textStyle(PokemonNameDetailStyle())
                            Text(pokemonDetailVM.name.capitalized).textStyle(PokemonNameDetailStyle())
                                .padding()
                        }                        .padding(.top, 30)
                        
                        HStack(spacing: 20){
                            ForEach(pokemonDetailVM.types, id: \.self) { typeName in
                                VStack{
                                    Text(typeName)
                                    
                                }.padding(5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Types.Pokemon(rawValue: typeName)!.color, lineWidth: 2.9))
                                    .background(Color.white)
                                    
                                    //                                    .cornerRadius(15)
                                    .shadow(color: Color.black.opacity(0.2), radius: 7, x: 10, y: 10)
                                    .foregroundColor(Types.Pokemon(rawValue: typeName)!.color)
                            }
                        }.padding(.bottom)
                    }
                    VStack{
                        ImageViewComponent(url: pokemonDetailVM.urlImage, type: .banner)
                    }
                    .padding(.trailing, 20)
                    .padding(.leading, 20)
                }.padding(.top, 30)
                HStack{
                    Spacer()
                    Text("Height: \(pokemonDetailVM.height)m").textStyle(PokemonInfoDetailStyle())
                    Text("Weight: \(pokemonDetailVM.weight)kg")
                        .textStyle(PokemonInfoDetailStyle())
                }.padding(.trailing, 10)
                
                VStack{
                    HStack{
                        Spacer()
                    }
                    VStack(spacing: 8){
                        
                        SegmentedComponent(selected: self.$selected, primaryColor: pokemonDetailVM.color)
                        
                        if self.selected == 0{
                            StatsView(pokeStats: pokemonDetailVM.stats, color: pokemonDetailVM.color)
                        }
                        else{
                            
                            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).background(pokemonDetailVM.color)
                        }
                        
                    }.background(Color("Color").edgesIgnoringSafeArea(.all))
                    Spacer()
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).background(pokemonDetailVM.color)
                    Spacer()
                }.background(Color.white)
                    .cornerRadius(radius: 40, corners: [.topLeft, .topRight])
                    
                    .padding(.top, 20)
                
                
            }
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
