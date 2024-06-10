//
//  CharacterViewModel.swift
//  SwiftUI-MenuBar-Gemini
//
//  Created by Remon Nakashima on R 6/06/10.
//

import SwiftUI

class CharacterViewModel: ObservableObject {
    @Published var stomachLevel: Double = 0.5
    @Published var snackLevel: Double = 0.5
    @Published var affectionLevel: Double = 0.4
    @Published var characterImage: String = "cat_front"
    @Published var characterPosition: CGFloat = 150
    @Published var iqLevel: Double = 0.6
    @Published var eqLevel: Double = 0.7
    @Published var isEating: Bool = false
    @Published var isShowering: Bool = false
    @Published var colorFactor: Double = 1.0
    
    let characterImages = ["cat_front", "cat_right", "cat_left"]
    let screenWidth: CGFloat = 300

    private var lastDirtinessIncreaseDate: Date?
    
    func startImageRotation() {
        Timer.scheduledTimer(withTimeInterval: Double.random(in: 2...5), repeats: true) { timer in
            if !self.isEating && !self.isShowering {
                self.characterImage = self.characterImages.randomElement() ?? "cat_front"
                self.updateCharacterPosition()
            }
        }
    }
    
    func startPositionAnimation() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if !self.isEating && !self.isShowering {
                withAnimation(.easeInOut(duration: 1)) {
                    if self.characterImage.contains("right") {
                        self.characterPosition = self.screenWidth - 25
                    } else if self.characterImage.contains("left") {
                        self.characterPosition = 25
                    } else if self.characterImage.contains("front") {
                        // 位置を変更しない
                    } else {
                        self.characterPosition = CGFloat.random(in: 25...(self.screenWidth - 25))
                    }
                }
            }
        }
    }
    
    func updateCharacterPosition() {
        withAnimation(.easeInOut(duration: 1)) {
            if characterImage.contains("right") {
                characterPosition = screenWidth - 25
            } else if characterImage.contains("left") {
                characterPosition = 25
            } else if characterImage.contains("front") {
                // 位置を変更しない
            } else {
                characterPosition = CGFloat.random(in: 25...(screenWidth - 25))
            }
        }
    }
    
    func feedCharacter() {
        isEating = true
        characterImage = "cat_eat"
        stomachLevel = min(stomachLevel + 0.1, 1.0)
        updateAffectionLevel()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isEating = false
            self.characterImage = "cat_front"
        }
    }
    
    func giveSnack() {
        isEating = true
        characterImage = "cat_snack"
        snackLevel = min(snackLevel + 0.1, 1.0)
        updateAffectionLevel()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isEating = false
            self.characterImage = "cat_front"
        }
    }
    
    func takeShower() {
        isShowering = true
        characterImage = "cat_shower"
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isShowering = false
            self.colorFactor = 1.0
            self.characterImage = "cat_front"
        }
    }
    
    func startColorAnimation() {
        Timer.scheduledTimer(withTimeInterval: 300, repeats: true) { timer in // 5分ごとにチェック
            guard let lastDate = self.lastDirtinessIncreaseDate else {
                self.lastDirtinessIncreaseDate = Date()
                return
            }
            let currentDate = Date()
            let interval = currentDate.timeIntervalSince(lastDate)
            if interval > 86400 { // 1日以上経過した場合
                self.colorFactor = max(self.colorFactor - 0.1, 0.1)
                self.lastDirtinessIncreaseDate = currentDate
            }
        }
    }
    
    func updateAffectionLevel() {
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
    
    func updateSystemMetrics() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
            let cpuUsage = self.getCpuUsage()
            let ramUsage = self.getRamUsage()
            
            self.iqLevel = cpuUsage
            self.eqLevel = ramUsage
        }
    }
    
    private func getCpuUsage() -> Double {
        return Double.random(in: 0...1)
    }
    
    private func getRamUsage() -> Double {
        return Double.random(in: 0...1)
    }
}
