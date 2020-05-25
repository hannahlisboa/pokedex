//
//  StatsView.swift
//  pokedex-challenge
//
//  Created by Hannah  on 21/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

struct StatsView: View {
    
    @ObservedObject var statsMV: StatsViewModel
    
    init(pokeStats: [PokeStat], color: Color ) {
        statsMV = StatsViewModel(stats: pokeStats, color: color)
    }
    
    var body: some View {
        VStack{
            ForEach(0..<self.statsMV.values.count, id: \.self) { index in
                HStack{
                    VStack{
                        Text(self.statsMV.names[index])
                            .font(.system(size: 12))
                            .foregroundColor(self.statsMV.color)
                    }
                    .frame(width: 35)
                    .padding(.leading, 10)
                    ProgressBar(value: CGFloat(self.statsMV.values[index]), progressColor: self.statsMV.color).padding()
                }
            }
        }.padding(.top)
    }
}
