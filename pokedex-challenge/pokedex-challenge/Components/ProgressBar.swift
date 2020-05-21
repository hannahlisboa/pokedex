//
//  ProgressBar.swift
//  pokedex-challenge
//
//  Created by Hannah  on 21/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    var value: CGFloat
    
    var progressColor: Color?
    
    var body: some View {
        GeometryReader { geometry in
            HStack() {
                Text(self.getPercentage(self.value))
                ZStack(alignment: .leading) {
                    Rectangle()
                        .opacity(0.1)
                    Rectangle()
                        .frame(minWidth: 0, idealWidth:self.getProgressBarWidth(geometry: geometry),
                               maxWidth: self.getProgressBarWidth(geometry: geometry))
                        .opacity(0.1)
                        .background(self.progressColor)
                        .animation(.default)
                }.padding(.trailing, 10)
                    .frame(height:7)
            }.frame(height:7)
        }
    }
    
    func getProgressBarWidth(geometry:GeometryProxy) -> CGFloat {
        let frame = geometry.frame(in: .global)
        return frame.size.width * value
    }
    
    func getPercentage(_ value:CGFloat) -> String {
        let intValue = Int(ceil(value * 100))
        return String(intValue)
    }
    
}
