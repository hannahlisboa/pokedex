//
//  SegmentedComponent.swift
//  pokedex-challenge
//
//  Created by Hannah  on 21/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

struct SegmentedComponent : View {
    
    @Binding var selected : Int
    var primaryColor: Color
    var body : some View{
        
        HStack{
            Button(action: {
                self.selected = 0
            }) {
                Text(Constants.Data.Strings.statsTitle)
                    .textStyle(SegmentedTextStyle())
                    .background(self.selected == 0 ? primaryColor : Color.clear)
                    .clipShape(Capsule())
            }
            .foregroundColor(self.selected == 0 ? .white : primaryColor)
            Button(action: {
                self.selected = 1
            }) {
                Text(Constants.Data.Strings.evolutionsTitle)
                    .textStyle(SegmentedTextStyle())
                    .background(self.selected == 1 ? primaryColor : Color.clear)
                    .clipShape(Capsule())

            }
            .foregroundColor(self.selected == 1 ? .white : primaryColor)
            Button(action: {
                self.selected = 2
            }) {
                Text(Constants.Data.Strings.profileTitle)
                    .textStyle(SegmentedTextStyle())
                    .background(self.selected == 2 ? primaryColor : Color.clear)
                    .clipShape(Capsule())
            }
            .foregroundColor(self.selected == 2 ? .white : primaryColor)
        }.padding(8)
            .background(Color.white)
            .clipShape(Capsule())
            .animation(.default)
    }
}

