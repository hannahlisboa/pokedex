//
//  NotFoundView.swift
//  pokedex-challenge
//
//  Created by Hannah  on 24/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

struct NotFoundView: View {
    var show: Bool
    var searchText: String
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
            }
            if self.show {
                Image(systemName: Constants.Design.Image.magnifyingglass)
                    .font(.system(size: 100))
                .foregroundColor(Color(Constants.Design.Color.Blue))

                Text(Constants.Data.Strings.notFoundText(terms: searchText)).textStyle(NotFoundStyle())
                
            }
        }.onTapGesture {
            UIApplication.shared.endEditing(true)
        }
        
    }
}

