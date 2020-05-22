//
//  EvolutionViewModel.swift
//  pokedex-challenge
//
//  Created by Hannah  on 22/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation

class EvolutionViewModel: ObservableObject {
    @Published var evolutionChain = [EvolutionNode]()
    @Published var isLoading = false
    @Published var showMsgError = false
    @Published var urlImage = String()
//    @Published var color = Color.white
    var id = String()
    
    init(id: String){
        self.id = id
    }
   
    
    fileprivate func loadChain (chainList: [Chain]) -> [EvolutionNode]{
        var array = [Chain]()
        var types = [EvolutionNode]()
        for item in chainList {
            array.append(item)
            let chain = EvolutionNode(chain: item)
            types.append(chain)
            if (!item.evolvesTo.isEmpty){
                types.append(contentsOf: loadChain(chainList: item.evolvesTo))
            }
        }
        return types
    }
    func fetchEvolution(idSpecie: String){
        
        if (isLoading){
            return
        }
        isLoading = true
        
        let provider = NetworkManager()
        provider.getEvolution(id: idSpecie) { (result) in
            self.isLoading = false
            switch result{
            case.success(let evolutionResult):
                self.showMsgError = false
                self.evolutionChain = self.loadChain(chainList: evolutionResult.chain.evolvesTo)
            case .failure(let error):
                self.showMsgError = true
                print("Error", error)
            }
        }
        
    }
    
    func fetchSpecie(){
        
        if (isLoading){
            return
        }
        isLoading = true
        
        let provider = NetworkManager()
        provider.getSpecie(id: id) { (result) in
            self.isLoading = false
            switch result{
            case.success(let specieResult):
                self.showMsgError = false
                self.fetchEvolution(idSpecie: Helpers.getId(item: specieResult.evolutionChain.url))
            case .failure(let error):
                self.showMsgError = true
                print("Error", error)
            }
        }
        
    }
}
