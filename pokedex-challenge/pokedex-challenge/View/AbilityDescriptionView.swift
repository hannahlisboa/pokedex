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
    
    func fetchData(){
        self.abilityVM.fetchAbility()
    }
    
    var body: some View {
        ZStack (alignment: .center){
            VStack{
                Text(abilityVM.title.uppercased()).textStyle(TitleAbilityDescriptionStyle())
                Text(abilityVM.description).textStyle(DescriptionAbilityStyle())
            }
            ActivityIndicator(isAnimating: true, style: .large).opacity(abilityVM.isLoading ? 1: 0)
            ErrorView(show: abilityVM.showMsgError, tapView: self.fetchData)
        }.banner(data: Constants.Data.bannerDataConnection, show: self.$abilityVM.networkConnectionError)
        .onAppear(){
            self.fetchData()
        }
    }
}
