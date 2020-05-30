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
            VStack(alignment:.leading){
                Text(typePokemonCellVM.idPokemon).textStyle(TypeIdCellStyle())
                Text(typePokemonCellVM.name).textStyle(TypeTitleCellStyle())
                .accessibility(identifier: "NameOfTextLabelInCell")
            }.padding(20)
            Spacer()
        }.padding()
        .background(Color.white)
            .shadow(color: Color.black.opacity(0.1), radius: 0, x: 0, y: 0.5)

    }
}
