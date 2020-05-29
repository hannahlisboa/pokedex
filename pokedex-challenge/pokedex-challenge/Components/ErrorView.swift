//
//  ErrorView.swift
//  pokedex-challenge
//
//  Created by Hannah  on 26/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

/// view responsable from show message error
struct ErrorView: View {
    var show: Bool
    var tapView: () -> Void
    var body: some View {
        
        VStack {
            HStack {
                  Spacer()
              }
            if self.show {
                Spacer()
                Text(Constants.Data.Strings.sadText).font(.system(size: 100))
                Text(Constants.Data.Strings.genericError)
                    .textStyle(NotFoundStyle())
                Spacer()
            }
        }
            .onTapGesture {
                self.tapView()
        }
    }
}
