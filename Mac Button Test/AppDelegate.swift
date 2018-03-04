//
//  AppDelegate.swift
//  Mac Button Test
//
//  Created by Geof Crowl on 2/12/18.
//  Copyright © 2018 Geof Crowl. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let buttonsWC = ButtonsWindowController()
    
    override init() {
        NSWindow.allowsAutomaticWindowTabbing = false
        super.init()
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        buttonsWC.loadWindow()
        buttonsWC.showWindow(self)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}

