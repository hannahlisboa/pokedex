//
//  UIApplication+Keyboard.swift
//  pokedex-challenge
//
//  Created by Hannah  on 24/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//


import SwiftUI

extension UIApplication { func endEditing(_ force: Bool) {
    self.windows .filter{$0.isKeyWindow} .first? .endEditing(force) }
    
}
