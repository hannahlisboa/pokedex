//
//  ActivityIndicator.swift
//  pokedex-challenge
//
//  Created by Hannah  on 23/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import SwiftUI

/// class responsability load my custom activity indicator
struct ActivityIndicator: UIViewRepresentable {

    var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
