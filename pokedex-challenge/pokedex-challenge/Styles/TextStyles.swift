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
        .lineLimit(1)
            .font(Font.custom(Constants.Design.Font.Title, size: 14))
            .foregroundColor(Color(Constants.Design.Color.Blue))
    }
}

struct PokemonNameDetailStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom(Constants.Design.Font.SpecialItems, size: 26))
            .foregroundColor(Color.white)
    }
}
struct PokemonInfoDetailStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12))
            .foregroundColor(Color.white)
    }
}

struct DetailTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom(Constants.Design.Font.BrandFont, size: 20))
            .foregroundColor(Color(Constants.Design.Color.Blue))
    }
}
struct IdCellStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom(Constants.Design.Font.SpecialItems, size: 12))
            .foregroundColor(Color(Constants.Design.Color.Blue))
    }
}

extension Text {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}
