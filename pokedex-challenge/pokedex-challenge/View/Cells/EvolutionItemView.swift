//
//  EvolutionItemView.swift
//  pokedex-challenge
//
//  Created by Hannah  on 22/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

struct EvolutionItemView: View {
    
    @ObservedObject var evoItemVM: EvolutionItemViewModel
       
       init(species: Species) {
           evoItemVM = EvolutionItemViewModel(species: species)
       }
    
    var body: some View {
        VStack{
            ImageViewComponent(url: evoItemVM.urlImage, type: .icon)
            Text(evoItemVM.name)
        }.frame(width: 100)
    }
}
