//
//  PokemonListCellView.swift
//  pokedex-challenge
//
//  Created by Hannah  on 19/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

struct PokemonListCellView: View {
    var pokemonItem: PokemonListItem
    var body: some View {
        Text(pokemonItem.name)
    }
}

//struct PokemonListCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonListCellView()
//    }
//}
