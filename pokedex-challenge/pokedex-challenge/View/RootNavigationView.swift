//
//  RootView.swift
//  pokedex-challenge
//
//  Created by Hannah  on 19/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

struct RootNavigationView: View {
    
    init() {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: Constants.Design.Color.Yellow)

        let fontLarge: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: Constants.Design.Color.Blue)!,
            .font: UIFont(name:Constants.Design.Font.BrandFont, size: 40)!
        ]
        
        let fontNormal: [NSAttributedString.Key: Any] = [
                 .foregroundColor: UIColor(named: Constants.Design.Color.Blue)!,
                 .font: UIFont(name:Constants.Design.Font.BrandFont, size: 25)!
             ]

        appearance.largeTitleTextAttributes = fontLarge
        appearance.titleTextAttributes = fontNormal
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
     }
    
    
    var body: some View {
        NavigationView{
            PokemonListView()
                .navigationBarTitle(Constants.Data.Strings.navBarTitleApplication)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootNavigationView()
    }
}
