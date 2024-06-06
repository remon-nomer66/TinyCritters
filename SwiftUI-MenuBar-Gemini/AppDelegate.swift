//
//  AppDelegate.swift
//  SwiftUI-MenuBar-Gemini
//
//  Created by Remon Nakashima on R 6/06/06.
//

import SwiftUI

@main
struct MenuBarApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var popover = NSPopover()

    func applicationDidFinishLaunching(_ notification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        if let button = statusItem?.button {
            button.image = NSImage(systemSymbolName: "globe", accessibilityDescription: "Globe")
            button.action = #selector(togglePopover(_:))
        }
        popover.contentViewController = NSHostingController(rootView: ContentView())
    }

    @objc func togglePopover(_ sender: AnyObject?) {
        if popover.isShown {
            popover.performClose(sender)
        } else {
            if let button = statusItem?.button {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
                popover.contentViewController?.view.window?.becomeKey()
            }
        }
    }
}
