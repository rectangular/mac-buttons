//
//  ButtonView.swift
//  Mac Button Test
//
//  Created by Geof Crowl on 2/12/18.
//  Copyright © 2018 Geof Crowl. All rights reserved.
//

import Cocoa

class ButtonsView: NSView {
    
    let defaultButtonSize = NSSize(width: 120, height: 30)
    
    let hiddenButtonTitles = [
        "disclosure",
        "circular",
        "helpButton",
        "roundedDisclosure"
    ]
    
    var buttons = [NSButton]()
    var textViews = [NSTextView]()
    var dividers = [NSView]()
    
    var contentHeight = CGFloat()
    
    override var isFlipped: Bool {
        return true
    }

    init() {
        super.init(frame: .zero)
        
        for (index, style) in NSButton.BezelStyle.allValues.enumerated() {
            
            if !NSButton.BezelStyle.allStringValues.indices.contains(index) {
                return
            }
            
            let styleName = NSButton.BezelStyle.allStringValues[index]
            let button = NSButton()
            let textView = NSTextView()
            let divider = NSView()
            
            if hiddenButtonTitles.contains(styleName) {
                button.title = ""
            }
            
            button.bezelStyle = style
            addSubview(button)
            buttons.append(button)
            
            divider.wantsLayer = true
            divider.layer?.backgroundColor = NSColor.lightGray.cgColor
            addSubview(divider)
            dividers.append(divider)
            
            textView.string = styleName
            textView.backgroundColor = .clear
            textView.isEditable = false
            textView.isSelectable = false
            addSubview(textView)
            textViews.append(textView)
        }
        
        var prevButton: NSButton?
        for button in buttons {
            
            if let prevButton = prevButton {
                
                prevButton.nextKeyView = button
                
            } else {
                
                buttons.last?.nextKeyView = button
            }
            prevButton = button
        }
    }
    
    override func layout() {
        
        let centerX = round(frame.width / 2)
        let offsetY: CGFloat = 120
        
        for (index, button) in buttons.enumerated() {
            
            let buttonOffsetX = centerX - defaultButtonSize.width / 2
            var buttonOffsetY = offsetY * CGFloat(index)
            buttonOffsetY += round(offsetY / 2)
            buttonOffsetY += defaultButtonSize.height / 2
            buttonOffsetY -= 8
            
            button.frame.origin = NSPoint(x: buttonOffsetX, y: buttonOffsetY)
            button.frame.size = defaultButtonSize
            
            if textViews.indices.contains(index) {
                
                textViews[index].frame.origin = NSPoint(x: 16, y: buttonOffsetY - 40)
                textViews[index].frame.size = defaultButtonSize
            }
            
            if dividers.indices.contains(index) {
                
                dividers[index].frame.origin = NSPoint(x: 16, y: textViews[index].frame.minY - 8)
                dividers[index].frame.size = CGSize(width: bounds.width - 32, height: 1)
            }
        }
        
        contentHeight = buttons.last!.frame.maxY + 50
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
