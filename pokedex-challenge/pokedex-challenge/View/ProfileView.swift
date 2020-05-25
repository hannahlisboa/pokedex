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
    @ObservedObject var profileVM: ProfileViewModel
    @State var index = 0
    
    init(pokemon: Pokemon?, color: Color) {
        profileVM = ProfileViewModel(pokemon: pokemon, color: color)
    }
    var body: some View {
        VStack(alignment: .leading){
            Text("ABILITIES".capitalized)
                .fontWeight(.medium)
                .textStyle(ProfileTitleStyle())
            
                HStack(spacing: 10){
                    Spacer()
                    ForEach(profileVM.abilities, id: \.self) { ability in
                        Button(action: {
                            print("aqui")
                        }) {
                            Text(ability.ability.name)
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
            
            Text("SPRITES".capitalized)
                .fontWeight(.medium)
                .textStyle(ProfileTitleStyle())
            
            HStack(alignment: .center){
                Spacer()
                PagingView(index: $index.animation(), maxIndex: profileVM.urlImages.count - 1, color: self.profileVM.color) {
                    ForEach(self.profileVM.urlImages, id: \.self) { url in
                        ImageViewComponent(url: url, type: .banner)
                        
                    }
                }
                    //                .overlay(
                    //                    RoundedRectangle(cornerRadius: 5 )
                    //                        .stroke(self.profileVM.color, lineWidth: 0.9))
                    .padding(.top, -30)
                    
                    .frame(height:  ImageSizeHelper.getSizeHighlight().width)
                Spacer()
                
            }
            Spacer()
            
        }
    }
}


