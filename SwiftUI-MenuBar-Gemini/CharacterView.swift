//
//  CharacterView.swift
//  SwiftUI-MenuBar-Gemini
//
//  Created by Remon Nakashima on R 6/06/10.
//

import SwiftUI

struct CharacterView: View {
    @ObservedObject var viewModel: CharacterViewModel

    var body: some View {
        ZStack {
            Color.clear.frame(height: 150)
            Image(viewModel.characterImage)
                .resizable()
                .frame(width: 50, height: 50)
                .position(x: viewModel.characterPosition, y: 75)
                .colorMultiply(Color.white.opacity(viewModel.colorFactor))
        }
        .frame(width: viewModel.screenWidth, height: 150)
    }
}
