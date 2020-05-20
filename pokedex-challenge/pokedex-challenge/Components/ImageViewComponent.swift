//
//  ImageViewComponent.swift
//  pokedex-challenge
//
//  Created by Hannah  on 19/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//
import SwiftUI
import class Kingfisher.ImageCache
import KingfisherSwiftUI


/// Kingfisher component abstraction responsible for displaying images
struct ImageViewComponent: View {
    
    var targetSize = CGSize()
    var url: String
    
    let screenSize = UIScreen.main.bounds
    
    init(url: String, type: Types.Image) {
        
        self.url = url
        switch type {
        case .gridCell:
            self.targetSize = ImageSizeHelper.getSizeGridCell()
        case .banner:
            self.targetSize = ImageSizeHelper.getSizeGridCell()
        }
    }
    
    var body: some View {
        
        KFImage(URL(string: url))
            .cancelOnDisappear(true)
            .resizable()
            .onFailure { e in
                print("Error: \(e)")
            }
        .placeholder {
            HStack {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(10)
            }
            .foregroundColor(.gray)
        }
        .cancelOnDisappear(true)
        .aspectRatio(contentMode: .fill)
        .frame(width: self.targetSize.width, height: self.targetSize.height)
        .animation(.linear(duration: 0.4))
        
    }
}
