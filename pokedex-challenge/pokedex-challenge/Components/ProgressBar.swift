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
    @State private var isDisplayed = false
    
    var progressColor: Color?
    
    var body: some View {
        GeometryReader { geometry in
            HStack() {
                Text(self.getPercentage(self.value))
                    .font(.system(size: 12))
                ZStack(alignment: .leading) {
                    Rectangle()
                        
                        .opacity(0.1)
                        .cornerRadius(5.0)
                    
                    Rectangle()
                        .frame(minWidth: 0, idealWidth: self.isDisplayed ? self.getProgressBarWidth(geometry: geometry) : CGFloat(0),
                               maxWidth: self.isDisplayed ? self.getProgressBarWidth(geometry: geometry) : CGFloat(0))
                        .opacity(0.1)
                        .background(self.progressColor)
                        .animation(Animation.interpolatingSpring(stiffness: 60, damping: 10).delay(0.1))
                        .onAppear {
                            self.isDisplayed = true
                    }
                }.padding(.trailing, 10)
                    .cornerRadius(5.0)
                    .frame(height:7)
            }
            
        }.frame(height:7)
    }
    
    func getProgressBarWidth(geometry:GeometryProxy) -> CGFloat {
        let frame = geometry.frame(in: .global)
        return frame.size.width * value
    }
    
    func getPercentage(_ value:CGFloat) -> String {
        let intValue = Int(ceil(value * 100))
        return String(format: "%03d", intValue)
    }
    
}
