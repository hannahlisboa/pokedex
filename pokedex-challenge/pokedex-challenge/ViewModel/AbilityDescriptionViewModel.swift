//
//  AbilityDescriptionViewModel.swift
//  pokedex-challenge
//
//  Created by Hannah  on 25/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation

class AbilityDescriptionViewModel: ObservableObject {
    
     @Published var isLoading = false
     @Published var showMsgError = false
     @Published var description = String()
     @Published var title = String()

    var id: String
    
    init(id: String) {
        self.id = id
    }
    
        
    
    func fetchAbility(){
        
        if (isLoading){
                return
            }
            isLoading = true
            
            let provider = NetworkManager()
            provider.getAbilityDescription(id: id) { (result) in
                self.isLoading = false
                switch result{
                case.success(let abilityResult):
                    self.showMsgError = false
                    self.title = abilityResult.name.replacingOccurrences(of: "-", with: " ")
                    if let effectEntries = abilityResult.effectEntries.first{
                        self.description = effectEntries.effect
                    }
                case .failure(let error):
                    self.showMsgError = true
                    print("Error", error)
                }
            }
        
    }
    
}
