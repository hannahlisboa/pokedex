//
//  NavigationBackButton.swift
//  pokedex-challenge
//
//  Created by Hannah  on 20/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

struct NavigationBackButton: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    
    var title: String = ""
    var color: Color? = nil
    
    init(navigationTitle title:String, navigationColor color:Color?) {
        self.title = title
        self.color = color
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                    Image(systemName: "chevron.left").padding(.trailing, 10)
                    Text(title.capitalized)
                }
                
                Spacer()
            }.padding().foregroundColor((self.color != nil) ? self.color : Color.blue)
            
            Spacer()
        }
        
    }
}

