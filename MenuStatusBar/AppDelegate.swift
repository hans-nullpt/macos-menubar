//
//  AppDelegate.swift
//  MenuStatusBar
//
//  Created by Ivan Nur Ilham Syah on 22/10/24.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
  
  var mainWindow: NSWindow?
  
  func applicationDidFinishLaunching(_ aNotification: Notification) {
    mainWindow = MainWindow()
    
    createAppMenuBar()
    
    mainWindow?.makeKeyAndOrderFront(nil)
  }
  
  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }
  
  func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }
  
  internal func createAppMenuBar() {
    let mainMenu = NSApplication.shared.mainMenu
    
    guard let mainMenu else { return }
    
    let appMenu = NSMenu()
    
    // About Climbr
    let aboutAppItem = NSMenuItem(
      title: "About \(ProcessInfo.processInfo.processName)",
      action: nil,
      keyEquivalent: ""
    )
    appMenu.addItem(aboutAppItem)
    
    // Check For Updates
    let checkUpdateItem = NSMenuItem()
    checkUpdateItem.title = "Check for Updates..."
    appMenu.addItem(checkUpdateItem)
    
    appMenu.addItem(NSMenuItem.separator())
    
    // Settings
    let settingItem = NSMenuItem(
      title: "Settings...",
      action: nil,
      keyEquivalent: ""
    )
    appMenu.addItem(settingItem)
    
    appMenu.addItem(NSMenuItem.separator())
    
    // Hide Items
    let hideClimbrItem = NSMenuItem(
      title: "Hide \(ProcessInfo.processInfo.processName)",
      action: nil,
      keyEquivalent: ""
    )
    appMenu.addItem(hideClimbrItem)
    
    let hideOthersItem = NSMenuItem(
      title: "Hide Others",
      action: nil,
      keyEquivalent: ""
    )
    appMenu.addItem(hideOthersItem)
    
    let showAllItem = NSMenuItem(
      title: "Show All",
      action: nil,
      keyEquivalent: ""
    )
    appMenu.addItem(showAllItem)
    
    appMenu.addItem(NSMenuItem.separator())
    
    // Quit Items
    let quitItem = NSMenuItem(
      title: "Quit \(ProcessInfo.processInfo.processName)",
      action: #selector(quitApp),
      keyEquivalent: "q"
    )
    appMenu.addItem(quitItem)
    
    mainMenu.items.first?.submenu = appMenu
  }
  
  @objc private func quitApp(sender: Any?) {
    NSApplication.shared.terminate(sender)
  }
  
  
}

class MainWindow: NSWindow {
  init() {
    /// Init the main window with following parameters:
    super.init(
      contentRect: NSRect(x: 0, y: 0, width: 1200, height: 840),
      styleMask: [
        .titled, .closable, .miniaturizable, .fullSizeContentView
      ],
      backing: .buffered,
      defer: false
    )
    
    /// Set the title bar to transparent
    titlebarAppearsTransparent = true
    
    /// Set the window to center axis by default
    center()
    let vc = ViewController()
    contentView             = vc.view
    contentViewController   = vc
  }
  
}
