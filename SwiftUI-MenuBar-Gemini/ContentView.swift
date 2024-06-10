//
//  ContentView.swift
//  SwiftUI-MenuBar-Gemini
//
//  Created by Remon Nakashima on R 6/06/06.
//

import SwiftUI

struct ContentView: View {
    @State private var stomachLevel: Double = 0.5
    @State private var snackLevel: Double = 0.5
    @State private var affectionLevel: Double = 0.4
    @State private var characterImage: String = "cat_front"
    @State private var characterPosition: CGFloat = 150 // 初期位置を中央に設定
    @State private var iqLevel: Double = 0.6
    @State private var eqLevel: Double = 0.7
    @State private var isEating: Bool = false // キャラクターが食べているかどうかのフラグ
    @State private var colorFactor: Double = 1.0 // 色の明るさを管理するためのプロパティ
    private let characterImages = ["cat_front", "cat_right", "cat_left"]
    private let screenWidth: CGFloat = 300 // 表示領域の幅を適切に設定
    
    var body: some View {
        VStack {
            ZStack {
                Color.clear.frame(height: 150) // 背景を透明にして高さを確保
                Image(characterImage)
                    .resizable()
                    .frame(width: 50, height: 50) // キャラクター画像のサイズを調整
                    .position(x: characterPosition, y: 75) // 位置を設定
                    .colorMultiply(Color.white.opacity(colorFactor)) // 色の明るさを適用
                    .onAppear {
                        startImageRotation()
                        startPositionAnimation()
                        startColorAnimation()
                    }
            }
            .frame(width: screenWidth, height: 150) // 表示領域のサイズを設定
            
            HStack {
                TextField("質問入力", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("送信") {
                    // アクションを追加
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 10)
            
            HStack {
                Button(action: {
                    feedCharacter()
                }) {
                    Image(systemName: "frying.pan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.black)
                        .padding(20) // パディングを追加してボタンを大きくする
                }
                .frame(width: 70, height: 70) // ボタン自体のサイズを指定
                .padding()
                
                Button(action: {
                    giveSnack()
                }) {
                    Image(systemName: "popcorn")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.black)
                        .padding(20) // パディングを追加してボタンを大きくする
                }
                .frame(width: 70, height: 70) // ボタン自体のサイズを指定
                .padding()
                
                Button(action: {
                    takeShower()
                }) {
                    Image(systemName: "shower")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.black)
                        .padding(20) // パディングを追加してボタンを大きくする
                }
                .frame(width: 70, height: 70) // ボタン自体のサイズを指定
                .padding()
                
                Button(action: {
                    //takeMedicine()
                }) {
                    Image(systemName: "cross.case")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.black)
                        .padding(20) // パディングを追加してボタンを大きくする
                }
                .frame(width: 70, height: 70) // ボタン自体のサイズを指定
                .padding()
            }
            .padding(.bottom, 10)
            
            HStack {
                ProgressBar(icon: "frying.pan", text: "おなか", value: $stomachLevel)
                ProgressBar(icon: "heart", text: "なつき度", value: $affectionLevel)
            }
            .padding(.horizontal)
            
            HStack {
                ProgressBar(icon: "cpu", text: "IQ", value: $iqLevel)
                ProgressBar(icon: "memorychip", text: "EQ", value: $eqLevel)
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
        .padding()
        .onAppear {
            updateSystemMetrics()
        }
    }
    
    private func startImageRotation() {
        Timer.scheduledTimer(withTimeInterval: Double.random(in: 2...5), repeats: true) { timer in
            if !isEating {
                characterImage = characterImages.randomElement() ?? "cat_front"
                updateCharacterPosition()
            }
        }
    }
    
    private func startPositionAnimation() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if !isEating {
                withAnimation(.easeInOut(duration: 1)) {
                    if characterImage.contains("right") {
                        characterPosition = screenWidth - 25 // 右端に移動
                    } else if characterImage.contains("left") {
                        characterPosition = 25 // 左端に移動
                    } else if characterImage.contains("front") {
                        // 位置を変更しない
                    } else {
                        characterPosition = CGFloat.random(in: 25...(screenWidth - 25)) // ランダムに移動
                    }
                }
            }
        }
    }
    
    private func updateCharacterPosition() {
        withAnimation(.easeInOut(duration: 1)) {
            if characterImage.contains("right") {
                characterPosition = screenWidth - 25 // 右端に移動
            } else if characterImage.contains("left") {
                characterPosition = 25 // 左端に移動
            } else if characterImage.contains("front") {
                // 位置を変更しない
            } else {
                characterPosition = CGFloat.random(in: 25...(screenWidth - 25)) // ランダムに移動
            }
        }
    }
    
    private func feedCharacter() {
        isEating = true
        characterImage = "cat_eat"
        stomachLevel = min(stomachLevel + 0.1, 1.0)
        updateAffectionLevel()
        // 一定時間後に食べ終わる
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isEating = false
            characterImage = "cat_front"
        }
    }
    
    private func giveSnack() {
        isEating = true
        characterImage = "cat_snack"
        snackLevel = min(snackLevel + 0.1, 1.0)
        updateAffectionLevel()
        // 一定時間後に食べ終わる
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isEating = false
            characterImage = "cat_front"
        }
    }
    
    private func takeShower() {
        characterImage = "cat_shower"
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 1)) {
                colorFactor = 1.0 // 色の明るさを元に戻す
                characterImage = "cat_front"
            }
        }
    }
    
    private func startColorAnimation() {
        Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { timer in
            withAnimation(.easeInOut(duration: 10)) {
                colorFactor = max(colorFactor - 0.1, 0.1) // 徐々に色を暗くする
            }
        }
    }
    
    private func updateAffectionLevel() {
        let currentDate = Date()
        let lastFedDate = UserDefaults.standard.object(forKey: "lastFedDate") as? Date ?? Date()
        let lastSnackDate = UserDefaults.standard.object(forKey: "lastSnackDate") as? Date ?? Date()
        
        let calendar = Calendar.current
        if calendar.isDateInToday(lastFedDate) && calendar.isDateInToday(lastSnackDate) {
            affectionLevel = min(affectionLevel + 0.05, 1.0)
        } else {
            affectionLevel = max(affectionLevel - 0.05, 0.0)
        }
        
        UserDefaults.standard.set(currentDate, forKey: "lastFedDate")
        UserDefaults.standard.set(currentDate, forKey: "lastSnackDate")
    }
    
    private func updateSystemMetrics() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
            // システムメトリクスを取得するためのコード
            let cpuUsage = getCpuUsage()
            let ramUsage = getRamUsage()
            
            iqLevel = cpuUsage
            eqLevel = ramUsage
        }
    }
    private func getCpuUsage() -> Double {
        // CPU使用率を取得するためのダミーコード
        // 実際には適切な方法でCPU使用率を取得する必要がある
        return Double.random(in: 0...1)
    }
    
    private func getRamUsage() -> Double {
        // RAM使用率を取得するためのダミーコード
        // 実際には適切な方法でRAM使用率を取得する必要がある
        return Double.random(in: 0...1)
    }
}

struct ProgressBar: View {
    var icon: String
    var text: String
    @Binding var value: Double
    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 30, height: 30)
                .aspectRatio(contentMode: .fit) // アイコンの比率を保つ
            Text(text)
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle().frame(width: geometry.size.width, height: geometry.size.height)
                        .opacity(0.3)
                        .foregroundColor(.gray)

                    Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
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

#Preview {
ContentView()
}
