//
//  EvolutionView.swift
//  pokedex-challenge
//
//  Created by Hannah  on 21/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

struct EvolutionView: View {
    
    @ObservedObject var evolutionVM: EvolutionViewModel
    
    init(id: String) {
        evolutionVM = EvolutionViewModel(id: id)
    }
    var body: some View {
        ZStack (alignment: .center){
            VStack (alignment:.leading){
                List{
                    ForEach(self.evolutionVM.evolution , id: \.self) { evolutionTo in
                        VStack{
                            ForEach(evolutionTo.evolutionTo , id: \.self) { item in
                                HStack(){
                                    Spacer()
                                    
                                    EvolutionItemView(species: evolutionTo.species)
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right.2")
                                    Spacer()
                                    
                                    EvolutionItemView(species: item.species)
                                    Spacer()
                                    
                                }.padding()
                            }.listRowInsets(EdgeInsets())
                        }.padding()
                    }.listRowInsets(EdgeInsets())
                }
                
            }
            .onAppear(){
                self.evolutionVM.fetchData()
            }
            ActivityIndicator(isAnimating: true, style: .large).opacity(evolutionVM.isLoading ? 1: 0)
        }
    }
}
