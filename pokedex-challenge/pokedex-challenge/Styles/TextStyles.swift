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

struct NotFoundStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 26))
            .foregroundColor(Color(Constants.Design.Color.Blue))
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.center)
            .padding(10)
    }
}

struct DetailTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom(Constants.Design.Font.BrandFont, size: 20))
            .foregroundColor(Color(Constants.Design.Color.Blue))
    }
}
struct ProfileTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.leading)
            .foregroundColor(Color.gray)
    }
}

struct IdCellStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom(Constants.Design.Font.SpecialItems, size: 12))
            .foregroundColor(Color(Constants.Design.Color.Blue))
    }
}

struct TitleAbilityDescriptionStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .lineLimit(1)
            .font(Font.custom(Constants.Design.Font.Title, size: 16))
            .foregroundColor(Color(Constants.Design.Color.Blue))
            .padding()
    }
}
struct DescriptionAbilityStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(Color.gray)
    }
}
