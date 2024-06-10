//
//  MainView.swift
//  SwiftUI-MenuBar-Gemini
//
//  Created by Remon Nakashima on R 6/06/10.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CharacterViewModel()

    var body: some View {
        VStack {
            CharacterView(viewModel: viewModel)
                .onAppear {
                    viewModel.startImageRotation()
                    viewModel.startPositionAnimation()
                    viewModel.startColorAnimation()
                }
            
            HStack {
                TextField("質問入力", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("送信") {
                    // アクションを追加
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 10)
            
            ActionButtons(viewModel: viewModel)
            ProgressBarView(viewModel: viewModel)
        }
        .padding()
        .onAppear {
            viewModel.updateSystemMetrics()
        }
    }
}

#Preview {
    ContentView()
}

