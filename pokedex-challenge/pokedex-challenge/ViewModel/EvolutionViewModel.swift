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
    @Published var evolve = true
    var id = String()
    
    init(id: String){
        self.id = id
    }
    
    fileprivate func loadChain (chain: Chain) -> [EvolutionNode]{
        var nodes = [EvolutionNode]()
        var chainList = [Chain]()
        if chain.evolvesTo.isEmpty{
            evolve = false
            return nodes
        }
        
        for item in chain.evolvesTo {
            chainList.append(item)
            if (!item.evolvesTo.isEmpty){
                nodes.append(contentsOf: loadChain(chain: item))
            }
        }
        let evolution = EvolutionNode(species: chain.species,  chains: chainList)
        nodes.append(evolution)
        
        return nodes
       }
   
    func fetchEvolution(idSpecie: String){
        
        let provider = NetworkManager()
        provider.getEvolution(id: idSpecie) { (result) in
            self.isLoading = false
            switch result{
            case.success(let evolutionResult):
                self.showMsgError = false
                self.evolution = self.loadChain(chain: evolutionResult.chain).reversed()
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
            switch result{
            case.success(let specieResult):
                self.showMsgError = false
                self.fetchEvolution(idSpecie: Helpers.getId(url: specieResult.evolutionChain.url))
            case .failure(let error):
                self.showMsgError = true
                self.isLoading = false
                print("Error", error)
            }
        }
        
    }
    
    func fetchData(){
        
        if (evolution.isEmpty){
            fetchSpecie()
        }
    }
}
