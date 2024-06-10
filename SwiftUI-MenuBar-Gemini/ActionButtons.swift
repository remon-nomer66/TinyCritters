//
//  ActionButtons.swift
//  SwiftUI-MenuBar-Gemini
//
//  Created by Remon Nakashima on R 6/06/10.
//

import SwiftUI

struct ActionButtons: View {
    @ObservedObject var viewModel: CharacterViewModel

    var body: some View {
        HStack {
            Button(action: {
                viewModel.feedCharacter()
            }) {
                Image(systemName: "frying.pan")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.black)
                    .padding(20)
            }
            .frame(width: 70, height: 70)
            .padding()
            
            Button(action: {
                viewModel.giveSnack()
            }) {
                Image(systemName: "popcorn")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.black)
                    .padding(20)
            }
            .frame(width: 70, height: 70)
            .padding()
            
            Button(action: {
                viewModel.takeShower()
            }) {
                Image(systemName: "shower")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.black)
                    .padding(20)
            }
            .frame(width: 70, height: 70)
            .padding()
            
            Button(action: {
                //viewModel.takeMedicine()
            }) {
                Image(systemName: "cross.case")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.black)
                    .padding(20)
            }
            .frame(width: 70, height: 70)
            .padding()
        }
        .padding(.bottom, 10)
    }
}
