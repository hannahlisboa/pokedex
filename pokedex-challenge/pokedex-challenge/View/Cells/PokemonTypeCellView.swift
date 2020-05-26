//
//  PokemonTypeCellView.swift
//  pokedex-challenge
//
//  Created by Hannah  on 25/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

struct PokemonTypeCellView: View {
    
    @ObservedObject var typePokemonCellVM: PokemonTypeCellViewModel
    
    init(type: Type) {
        typePokemonCellVM = PokemonTypeCellViewModel(type: type)
    }
    var body: some View {
        HStack {
            ImageViewComponent(url: typePokemonCellVM.urlImage, type: .gridCell)
            VStack{
                Text(typePokemonCellVM.idPokemon)
                Text(typePokemonCellVM.name)
            }.padding(20)
        }
    }
}
