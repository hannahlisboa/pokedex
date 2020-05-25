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
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 100))
                .foregroundColor(Color(Constants.Design.Color.Blue))

                Text("No pokemon with \(searchText.uppercased()) were found.").textStyle(NotFoundStyle())
                
            }
        }.onTapGesture {
            UIApplication.shared.endEditing(true)
        }
        
    }
}

