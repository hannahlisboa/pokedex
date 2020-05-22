//
//  EvolutionItemViewModel.swift
//  pokedex-challenge
//
//  Created by Hannah  on 22/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//
import Foundation

class EvolutionItemViewModel: ObservableObject {
 
    @Published var urlImage = String()
    @Published var name = String()

    init(species: Species){
        let id = Helpers.getId(url: species.url)
        self.urlImage = Helpers.getUrlImage(id:id)
        self.name = species.name
    }
}

