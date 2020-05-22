//
//  EvolutionViewModel.swift
//  pokedex-challenge
//
//  Created by Hannah  on 22/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation

class EvolutionViewModel: ObservableObject {
    @Published var evolution = [EvolutionNode]()
    @Published var isLoading = false
    @Published var showMsgError = false
    @Published var urlImage = String()
    var id = String()
    
    init(id: String){
        self.id = id
    }
    
    fileprivate func loadChain (chain: Chain) -> [EvolutionNode]{
        var nodes = [EvolutionNode]()
        var chainList = [Chain]()
        let name = chain.species.name
        let id = Helpers.getId(item: chain.species.url)
        for item in chain.evolvesTo {
            chainList.append(item)
            if (!item.evolvesTo.isEmpty){
                nodes.append(contentsOf: loadChain(chain: item))
            }
        }
        let test = EvolutionNode(name: name, id: id, chains: chainList)
        nodes.append(test)
        
        return nodes
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
                self.evolution = self.loadChain(chain: evolutionResult.chain)
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
