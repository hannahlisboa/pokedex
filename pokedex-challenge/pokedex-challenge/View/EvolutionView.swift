//
//  EvolutionView.swift
//  pokedex-challenge
//
//  Created by Hannah  on 21/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

struct EvolutionView: View {
    
    @ObservedObject var evolutionVM: EvolutionViewModel
    
    init(id: String) {
        evolutionVM = EvolutionViewModel(id: id)
    }
    
    //    func loadChain (chainList: [Chain]) -> [Chain]{
    //        var array = [Chain]()
    //        for item in chainList {
    //            array.append(item)
    //            if (!item.evolvesTo.isEmpty){
    //                array.append(contentsOf: loadChain(chainList: item.evolvesTo))
    //            }
    //        }
    //
    //        return array
    //    }
    //
    
    //    func loadChain (chainList: [Chain]) -> [EvolutionNode]{
    //           var array = [Chain]()
    //        var types = [EvolutionNode]()
    //           for item in chainList {
    //               array.append(item)
    //                let chain = EvolutionNode(chain: item)
    //                types.append(chain)
    //               if (!item.evolvesTo.isEmpty){
    //                   types.append(contentsOf: loadChain(chainList: item.evolvesTo))
    //               }
    //           }
    //
    //           return types
    //       }
    //
    var body: some View {
        HStack{
            ForEach(self.evolutionVM.evolutionChain, id: \.self) { evolution in

                Text(evolution.name)
            }
            
        }
      .onAppear(){
        self.evolutionVM.fetchSpecie()
        }
    }
}
