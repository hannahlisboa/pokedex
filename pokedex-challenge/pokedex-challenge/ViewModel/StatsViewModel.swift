//
//  StatsViewModel.swift
//  pokedex-challenge
//
//  Created by Hannah  on 21/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

class StatsViewModel: ObservableObject {
    
    var stats: [PokeStat]
    @Published var names = [String]()
    @Published var values = [Int]()
    @Published var color = Color.white

    init(stats: [PokeStat], color: Color){
        self.color = color
        self.stats = stats
        for stat in stats {
            names.append(setNameStat(stat: stat.stat.name))
            values.append(stat.baseStat)
        }
    }
    
    func setNameStat(stat: String) -> (String) {
           switch stat {
               case "hp":
                   return "HP"
               case "attack":
                   return "ATK"
               case "defense":
                   return "DEF"
               case "speed":
                   return "SPD "
               case "special-attack":
                   return "SATK"
               case "special-defense":
                   return "SDEF"
               default:
                   return ""
           }
       }
}
