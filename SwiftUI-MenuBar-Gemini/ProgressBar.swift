//
//  ProgressBar.swift
//  SwiftUI-MenuBar-Gemini
//
//  Created by Remon Nakashima on R 6/06/10.
//

import SwiftUI

struct ProgressBar: View {
    var icon: String
    var text: String
    @Binding var value: Double

    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 30, height: 30)
                .aspectRatio(contentMode: .fit)
            Text(text)
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle().frame(width: geometry.size.width, height: geometry.size.height)
                        .opacity(0.3)
                        .foregroundColor(.gray)
                    Rectangle().frame(width: min(CGFloat(self.value) * geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(.blue)
                        .animation(.linear, value: value)
                }
                .cornerRadius(45.0)
            }
            .frame(height: 10)
        }
        .padding()
    }
}
