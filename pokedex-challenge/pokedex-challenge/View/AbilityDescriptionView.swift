//
//  AbilityDescriptionView.swift
//  pokedex-challenge
//
//  Created by Hannah  on 25/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

struct AbilityDescriptionView: View {
    
    @ObservedObject var abilityVM: AbilityDescriptionViewModel
    
    init(id: String) {
        abilityVM = AbilityDescriptionViewModel(id: id)
    }
    
    var body: some View {
        VStack{
            Text(abilityVM.title)
            Text(abilityVM.description)
        }.onAppear(){
            self.abilityVM.fetchAbility()
        }
        
    }
}
