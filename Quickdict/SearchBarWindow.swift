//
//  SearchBarWindow.swift
//  Quickdict
//
//  Created by Tassilo Selover-Stephan on 16/03/15.
//  Copyright (c) 2015 Tassilo Selover-Stephan. All rights reserved.
//

import Cocoa

class SearchBarWindow: NSWindow {

    
    override init(contentRect: NSRect, styleMask aStyle: Int, backing bufferingType: NSBackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: aStyle, backing: bufferingType, defer: flag)
        self.opaque = false
        self.backgroundColor = NSColor.clearColor()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override var canBecomeKeyWindow: Bool {
        return true
    }
    
    override var canBecomeMainWindow: Bool {
        return true
    }
}
