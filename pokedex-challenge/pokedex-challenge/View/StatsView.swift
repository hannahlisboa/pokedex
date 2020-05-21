//
//  StatsView.swift
//  pokedex-challenge
//
//  Created by Hannah  on 21/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

struct StatsView: View {
    var pokeStats: [PokeStat]
    var color: Color
    var body: some View {
        VStack{
            ForEach(pokeStats, id: \.self) { stats in
                ProgressBar(value: CGFloat(stats.baseStat)/255, progressColor: self.color).padding()
            }
        }
    }
}

//struct StatsView_Previews: PreviewProvider {
//    static var previews: some View {
//        StatsView()
//    }
//}
