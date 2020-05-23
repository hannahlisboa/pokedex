//
//  ImageSizeHelper.swift
//  pokedex-challenge
//
//  Created by Hannah  on 19/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

class ImageSizeHelper{
    
    static func getSizeGridCell() -> CGSize {
        let screenSize = UIScreen.main.bounds
        var size = CGSize()
        size.width = screenSize.width/3 - 50
        size.height =  screenSize.width/3 - 50
        return  size
        
    }
    
    static func getSizeHighlight() -> CGSize {
          let screenSize = UIScreen.main.bounds
          var size = CGSize()
          size.width = screenSize.width/2 - 50
          size.height =  screenSize.width/2 - 50
          return  size
          
      }
    
    static func getSizeIcon() -> CGSize {
           let screenSize = UIScreen.main.bounds
           var size = CGSize()
           size.width = screenSize.width/4 - 50
           size.height =  screenSize.width/4 - 50
           return  size
           
       }
    
}
