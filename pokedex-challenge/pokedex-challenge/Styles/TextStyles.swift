//
//  TextStyles.swift
//  pokedex-challenge
//
//  Created by Hannah  on 20/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//
import SwiftUI

struct TitleCellStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
           .font(Font.custom(Constants.Design.Font.Title, size: 16))
           .foregroundColor(Color(Constants.Design.Color.Blue))
    }
}
struct IdCellStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
         .font(Font.custom(Constants.Design.Font.BrandFont, size: 14))
         .foregroundColor(Color(Constants.Design.Color.Blue))
    }
}

extension Text {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}
