//
//  MarkMyDayApp.swift
//  MarkMyDay
//
//  Created by Vinay Rajan S on 04/05/24.
//

import SwiftUI

@main
struct MarkMyDayApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate, ObservableObject{
    
    private var statusItem: NSStatusItem!
    private var popover: NSPopover!
    
    @MainActor func applicationDidFinishLaunching(_ notification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let statusButton = statusItem.button{
            statusButton.image = NSImage(systemSymbolName: "pencil", accessibilityDescription: "Mark My Day")
            statusButton.action = #selector(togglePopover)
        }
        self.popover = NSPopover()
        self.popover.contentSize = NSSize(width: 200, height: 320)
        self.popover.behavior = .transient
        self.popover.contentViewController = NSHostingController(rootView: ContentView())
    }
    
    @objc func togglePopover(){
        if let button = statusItem.button {
            if popover.isShown {
                self.popover.performClose(nil)
            } else {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            }
        }
    }
}
