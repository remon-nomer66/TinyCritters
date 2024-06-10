//
//  ProgressBarView.swift
//  SwiftUI-MenuBar-Gemini
//
//  Created by Remon Nakashima on R 6/06/10.
//

import SwiftUI

struct ProgressBarView: View {
    @ObservedObject var viewModel: CharacterViewModel

    var body: some View {
        VStack {
            HStack {
                ProgressBar(icon: "frying.pan", text: "おなか", value: $viewModel.stomachLevel)
                ProgressBar(icon: "heart", text: "なつき度", value: $viewModel.affectionLevel)
            }
            .padding(.horizontal)
            
            HStack {
                ProgressBar(icon: "cpu", text: "IQ", value: $viewModel.iqLevel)
                ProgressBar(icon: "memorychip", text: "EQ", value: $viewModel.eqLevel)
                VStack {
                    Text("世代")
                    Text("10")
                }
                VStack {
                    Text("年齢")
                    Text("3歳")
                }
            }
            .padding(.horizontal)
        }
    }
}
