//
//  PokemonListRowView.swift
//  pokedex-challenge
//
//  Created by Hannah  on 19/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

struct PokemonListRowView:  View {
    
    var pokemonListRow: [PokemonListItem]
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            
            ForEach(self.pokemonListRow, id: \.self) { pokemonItem in
                VStack{
                    PokemonListCellView(pokemonItem: pokemonItem)
                }
                .padding(.top)
                
            }
            Spacer()
            
        }
    }
    
}
