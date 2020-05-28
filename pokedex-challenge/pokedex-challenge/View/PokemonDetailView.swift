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
    
    @EnvironmentObject var sheetState: SheetState
    
    @ObservedObject var pokemonDetailVM: PokemonDetailViewModel
    init(pokeItem: PokemonListItem) {
        self.pokeItem = pokeItem
        pokemonDetailVM = PokemonDetailViewModel(id: pokeItem.id!)
        
    }
    
    //    var body: some View {
    //        ZStack {
    //            NavigationView {
    //                Text("")
    //            }
    //            .navigationBarTitle("")
    //            .navigationBarHidden(true)
    //
    //                                LinearGradient(gradient: Gradient(colors: [self.pokemonDetailVM.color, .white]), startPoint: .top, endPoint: .bottom)
    //                                    .edgesIgnoringSafeArea(.all)
    ////            LoadingView(isShowing: pokemonDetailVM.isLoading, content: {
    ////                ZStack{
    ////                    LinearGradient(gradient: Gradient(colors: [self.pokemonDetailVM.color, .white]), startPoint: .top, endPoint: .bottom)
    ////                        .edgesIgnoringSafeArea(.all)
    ////                    VStack {
    ////                        self.header()
    ////                        HStack{
    ////                            Spacer()
    ////                            Text("Height: \(self.pokemonDetailVM.height)m").textStyle(PokemonInfoDetailStyle())
    ////                            Text("Weight: \(self.pokemonDetailVM.weight)kg")
    ////                                .textStyle(PokemonInfoDetailStyle())
    ////                        }.padding(.trailing, 20)
    ////
    ////                        VStack{
    ////                            HStack{
    ////                                Spacer()
    ////                            }
    ////                            self.segmentedView()
    ////                            Spacer()
    ////                        }.background(Color.white)
    ////                            .cornerRadius(radius: 40, corners: [.topLeft, .topRight])
    ////                            .padding(.top, 20)
    ////                        Spacer()
    ////                    }
    ////                    .onAppear(){
    ////                        self.pokemonDetailVM.fetchPokemon()
    ////                    }
    ////                }
    ////
    ////            })
    //            NavigationBackButton(navigationTitle: "", navigationColor: Color.white)
    //
    //        }
    //
    //
    ////        .sheet(isPresented: self.$sheetState.showingDetail) {
    ////
    ////            if self.sheetState.activeSheetType == .typePokemon{
    ////                TypePokemonListView(id: self.sheetState.idDataSheet).environmentObject(self.sheetState)
    ////            }else{
    ////                AbilityDescriptionView(id: self.sheetState.idDataSheet)
    ////            }
    ////        }
    //    }
    
    @State var navBarHidden: Bool = true
    
    var body: some View {
        ZStack {
            LoadingView(isShowing: pokemonDetailVM.isLoading, content: {
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [self.pokemonDetailVM.color, .white]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        self.header()
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
                            self.segmentedView()
                            Spacer()
                        }.background(Color.white)
                            .cornerRadius(radius: 40, corners: [.topLeft, .topRight])
                            .padding(.top, 20)
                        Spacer()
                    }
                    .onAppear(){
                        self.pokemonDetailVM.fetchPokemon()
                    }
                }
                
            })
            NavigationBackButton(navigationTitle: "", navigationColor: Color.white)
            
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavigationBackButton(navigationTitle: "", navigationColor: Color.white)
            
        )
            
            .sheet(isPresented: self.$sheetState.showingDetail) {
                
                if self.sheetState.activeSheetType == .typePokemon{
                    TypePokemonListView(id: self.sheetState.idDataSheet).environmentObject(self.sheetState)
                }else{
                    AbilityDescriptionView(id: self.sheetState.idDataSheet)
                }
        }
        .navigationBarTitle("")
        .navigationBarHidden(self.navBarHidden)
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            self.navBarHidden = true
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            self.navBarHidden = false
        }
    }
    
    fileprivate func header() -> some View {
        return HStack{
            Spacer()
            VStack{
                VStack{
                    Text("# \(self.pokemonDetailVM.id)")
                        .textStyle(PokemonNameDetailStyle())
                    Text(self.pokemonDetailVM.name.capitalized).textStyle(PokemonNameDetailStyle())
                        .padding()
                }.padding(.top, 30)
                
                HStack(spacing: 20){
                    ForEach(self.pokemonDetailVM.types, id: \.self) { type in
                        
                        Button(action: {
                            self.sheetState.activeSheetType = .typePokemon
                            self.sheetState.idDataSheet = Helpers.getId(url: type.url)
                            self.sheetState.showingDetail.toggle()
                            
                        }) {
                            VStack{
                                Text(type.name)
                                    .foregroundColor(Types.Pokemon(rawValue: type.name)!.color)
                                    .padding([.horizontal, .vertical], 8)
                                    .background(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 0.9)
                                        .foregroundColor(Types.Pokemon(rawValue: type.name)!.color))
                                
                            }
                        }.buttonStyle(ButtonAnimatedStyle())
                    }
                    
                }.padding(.bottom)
            }
            VStack{
                ImageViewComponent(url: self.pokemonDetailVM.urlImage, type: .banner)
            }.opacity(self.pokemonDetailVM.urlImage.isEmpty ? 0: 1)
                .padding(.trailing, 20)
                .padding(.leading, 20)
        }.padding(.top, 30)
    }
    
    fileprivate func segmentedView() -> some View {
        return VStack(spacing: 8){
            
            SegmentedComponent(selected: self.$selected, primaryColor: self.pokemonDetailVM.color)
            
            if self.selected == 0{
                
                StatsView(pokeStats: self.pokemonDetailVM.stats, color: self.pokemonDetailVM.color)
            }
            else if self.selected == 1{
                
                EvolutionView(id: self.pokemonDetailVM.id)
            }else{
                ProfileView(pokemon: self.pokemonDetailVM.pokemon, color: self.pokemonDetailVM.color).environmentObject(self.sheetState)
            }
            
        }.background(Color("Color").edgesIgnoringSafeArea(.all))
    }
}
