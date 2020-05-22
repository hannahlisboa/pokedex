//
//  Helpes.swift
//  pokedex-challenge
//
//  Created by Hannah  on 21/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation

class Helpers {
    
    
    static func getId(url: String) -> String{
        let splitArray =  url.split(separator: "/")
        if let id = splitArray.last{
            return String(id)
        }
        return ""
    }
    static func getUrlImage(id: String) -> String{
        let url = Constants.API.baseImageURL + id + ".png"
        return url
    }
    
}
