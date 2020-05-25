//
//  Text+Style.swift
//  pokedex-challenge
//
//  Created by Hannah  on 24/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

extension Text {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}
