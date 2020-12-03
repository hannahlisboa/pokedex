//
//  ProfileView.swift
//  pokedex-challenge
//
//  Created by Hannah  on 25/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var pokemon:Pokemon?
  
    @EnvironmentObject var sheetState: SheetState

    @ObservedObject var profileVM: ProfileViewModel
    @State var index = 0
    
    init(pokemon: Pokemon?, color: Color ) {
        profileVM = ProfileViewModel(pokemon: pokemon, color: color)
    }
    var body: some View {
        VStack(alignment: .leading){
            Text(Constants.Data.Strings.abilitiesTitle.capitalized)
                .fontWeight(.medium)
                .textStyle(ProfileTitleStyle())
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack(spacing: 10){
                    Spacer()
                    ForEach(profileVM.abilities, id: \.self) { ability in
                        Button(action: {
                            self.sheetState.idDataSheet = Helpers.getId(url: ability.ability.url)
                            self.sheetState.activeSheetType = .abilityDescription
                            self.sheetState.showingDetail = true
                        }) {
                            Text(ability.ability.name.replacingOccurrences(of: "-", with: " "))
                                .foregroundColor(self.profileVM.color)
                                .padding([.horizontal, .vertical], 8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5    )
                                        .stroke(self.profileVM.color, lineWidth: 0.9))
                        }
                        .buttonStyle(ButtonAnimatedStyle())
                        
                    }
                    Spacer()
                    
                }.padding()
            }
            
            Text(Constants.Data.Strings.spritesTitle.capitalized)
                .fontWeight(.medium)
                .textStyle(ProfileTitleStyle())
            
            HStack(alignment: .center){
                Spacer()
                PagingView(index: $index.animation(), maxIndex: profileVM.urlImages.count - 1, content:  {
                    ForEach(self.profileVM.urlImages, id: \.self) { url in
                        ImageViewComponent(url: url, type: .banner)
                        
                    }
                }, color: self.profileVM.color)
                .padding(.top, -30)
                .frame(height:  ImageSizeHelper.getSizeHighlight().width)
                Spacer()
                
            }
            Spacer()
            
        }
    }
}


