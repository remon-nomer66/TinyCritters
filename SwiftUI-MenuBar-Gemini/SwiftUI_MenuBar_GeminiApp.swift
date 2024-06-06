//
//  SwiftUI_MenuBar_GeminiApp.swift
//  SwiftUI-MenuBar-Gemini
//
//  Created by Remon Nakashima on R 6/06/06.
//

import SwiftUI

struct SwiftUI_MenuBar_GeminiApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings {
            ContentView()
        }
    }
}
