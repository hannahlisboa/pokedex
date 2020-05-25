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
            LoadingView(isShowing: pokemonDetailVM.isLoading, content: {
                ZStack{
                    NavigationView {
                        Text("")
                    }
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    LinearGradient(gradient: Gradient(colors: [self.pokemonDetailVM.color, .white]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        HStack{
                            Spacer()
                            VStack{
                                VStack{
                                    Text("# \(self.pokemonDetailVM.id)")
                                        .textStyle(PokemonNameDetailStyle())
                                    Text(self.pokemonDetailVM.name.capitalized).textStyle(PokemonNameDetailStyle())
                                        .padding()
                                }.padding(.top, 30)
                                
                                HStack(spacing: 20){
                                    ForEach(self.pokemonDetailVM.types, id: \.self) { typeName in
                                        VStack{
                                            Text(typeName)
                                            
                                        }.padding(5)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .stroke(Types.Pokemon(rawValue: typeName)!.color, lineWidth: 2.9))
                                            .background(Color.white)
                                            .shadow(color: Color.black.opacity(0.2), radius: 7, x: 10, y: 10)
                                            .foregroundColor(Types.Pokemon(rawValue: typeName)!.color)
                                    }
                                }.padding(.bottom)
                            }
                            VStack{
                                ImageViewComponent(url: self.pokemonDetailVM.urlImage, type: .banner)
                            }.opacity(self.pokemonDetailVM.urlImage.isEmpty ? 0: 1)
                                .padding(.trailing, 20)
                                .padding(.leading, 20)
                        }.padding(.top, 30)
                        HStack{
                            Spacer()
                            Text("Height: \(self.pokemonDetailVM.height)m").textStyle(PokemonInfoDetailStyle())
                            Text("Weight: \(self.pokemonDetailVM.weight)kg")
                                .textStyle(PokemonInfoDetailStyle())
                        }.padding(.trailing, 20)
                        
                        VStack{
                            HStack{
                                Spacer()
                            }
                            VStack(spacing: 8){
                                
                                SegmentedComponent(selected: self.$selected, primaryColor: self.pokemonDetailVM.color)
                                
                                if self.selected == 0{
                                    StatsView(pokeStats: self.pokemonDetailVM.stats, color: self.pokemonDetailVM.color)
                                }
                                else if self.selected == 1{
                                    
                                    EvolutionView(id: self.pokemonDetailVM.id)
                                }else{
                                    ProfileView(pokemon: self.pokemonDetailVM.pokemon, color: self.pokemonDetailVM.color)
                                }
                                
                            }.background(Color("Color").edgesIgnoringSafeArea(.all))
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
                
            })
        }
    }
}

//struct PokemonDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetailView(id: 10)
//    }
//}
