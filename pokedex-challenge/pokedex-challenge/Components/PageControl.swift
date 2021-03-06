//
//  PageControl.swift
//  pokedex-challenge
//
//  Created by Hannah  on 19/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//


import SwiftUI

import UIKit

struct PageControl: View {
    @Binding var index: Int
    let maxIndex: Int
    let color: Color

    var body: some View {
        HStack(spacing: 8) {
            Spacer()
            ForEach(0...maxIndex, id: \.self) { index in
                Circle()
                    .fill(index == self.index ? self.color : Color.gray)
                    .frame(width: 8, height: 8)
            }
            Spacer()
        }
        .padding(15)
    }
}
