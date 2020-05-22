//
//  Array+Chunk.swift
//  pokedex-challenge
//
//  Created by Hannah  on 19/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//
import Foundation

extension Array {
    func chunked(into size:Int) -> [[Element]] {
        
        var chunkedArray = [[Element]]()
        
        for index in 0...self.count {
            if index % size == 0 && index != 0 {
                chunkedArray.append(Array(self[(index - size)..<index]) )
            } else if(index == self.count && chunkedArray.count>=0) {
                chunkedArray.append(Array(self[(index>0 ? index - 1 : index)..<index]) )
            }
        }
        return chunkedArray
    }
}

