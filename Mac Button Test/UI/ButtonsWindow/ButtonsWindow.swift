//
//  ButtonWindow.swift
//  Mac Button Test
//
//  Created by Geof Crowl on 2/12/18.
//  Copyright © 2018 Geof Crowl. All rights reserved.
//

import Cocoa

class ButtonsWindow: NSWindow {
    
    let buttonsVC = ButtonsViewController()
    
    static var defaultWidth: CGFloat {
        return 300
    }
    
    static var defaultHeight: CGFloat {
        return 750
    }
    
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        
        super.init(contentRect: contentRect, styleMask: style, backing: backingStoreType, defer: flag)
        
        delegate = self
        autorecalculatesKeyViewLoop = false
        title = "Mac Buttons"
        
        contentView = buttonsVC.view
    }
    
    func layoutWindow() {
        
        if let contentBounds = contentView?.bounds {
            
            buttonsVC.view.frame = contentBounds
            buttonsVC.view.needsLayout = true
            buttonsVC.view.layoutSubtreeIfNeeded()
            
            let contentSize = NSScrollView.contentSize(forFrameSize: buttonsVC.scrollView.frame.size, horizontalScrollerClass: nil, verticalScrollerClass: NSScroller.self, borderType: .noBorder, controlSize: .regular, scrollerStyle: .legacy)
            buttonsVC.buttonsView.frame = CGRect(x: 0, y: 0, width: contentSize.width, height: buttonsVC.buttonsView.contentHeight)
        }
    }
}

extension ButtonsWindow: NSWindowDelegate {
    
    func windowDidBecomeMain(_ notification: Notification) {
        layoutWindow()
    }
    
    func windowDidResize(_ notification: Notification) {
        layoutWindow()
    }
    
    func windowShouldClose(_ sender: NSWindow) -> Bool {
        return true
    }
    
}
