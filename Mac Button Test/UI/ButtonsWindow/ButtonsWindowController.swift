//
//  ButtonWindowController.swift
//  Mac Button Test
//
//  Created by Geof Crowl on 2/12/18.
//  Copyright © 2018 Geof Crowl. All rights reserved.
//

import Cocoa

class ButtonsWindowController: NSWindowController {
    
    var buttonsWindow: ButtonsWindow?

    override func loadWindow() {
        
        guard let visibleFrame = NSScreen.main?.visibleFrame else { return }
        
        let windowWidth = min(visibleFrame.width - 50, ButtonsWindow.defaultWidth)
        let windowHeight = min(visibleFrame.height - 50, ButtonsWindow.defaultHeight)
        
        let offsetX = round(visibleFrame.width / 2) - round(windowWidth / 2)
        let offsetY = round(visibleFrame.height / 2) - round(windowHeight / 2)
        
        let buttonsRect = NSRect(x: offsetX, y: offsetY, width: windowWidth, height: windowHeight)
        
        buttonsWindow = ButtonsWindow(contentRect: buttonsRect, styleMask: [.resizable, .closable, .miniaturizable, .titled ], backing: .buffered, defer: false)
        
        window = buttonsWindow!
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
    }

}
