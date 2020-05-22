//
//  Helpes.swift
//  pokedex-challenge
//
//  Created by Hannah  on 21/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation

class Helpers {
    

   static func getId(item: String) -> String{
             let splitArray =  item.split(separator: "/")
             if let id = splitArray.last{
                return String(id)
             }
           return ""
         }

    
}
