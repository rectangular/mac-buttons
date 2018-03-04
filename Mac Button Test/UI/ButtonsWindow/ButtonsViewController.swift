//
//  ButtonViewController.swift
//  Mac Button Test
//
//  Created by Geof Crowl on 2/12/18.
//  Copyright © 2018 Geof Crowl. All rights reserved.
//

import Cocoa

class ButtonsViewController: NSViewController {

    let buttonsView = ButtonsView()
    var scrollView = NSScrollView()
    
    override func loadView() {
        
        view = scrollView
        
        buttonsView.autoresizingMask = NSView.AutoresizingMask.height
        scrollView.hasVerticalScroller = true
        scrollView.scrollerStyle = .overlay
        scrollView.borderType = .noBorder
        scrollView.backgroundColor = .clear
        scrollView.drawsBackground = false
        scrollView.documentView = buttonsView
    }
    
}
