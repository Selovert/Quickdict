//
//  ServicesDelegate.swift
//  Quickdict
//
//  Created by Tassilo Selover-Stephan on 13/03/15.
//  Copyright (c) 2015 Tassilo Selover-Stephan. All rights reserved.
//

import Cocoa

class ServicesDelegate: NSObject {

    let delegate: AppDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
    
    override init() {
        
        super.init()
        
        NSApplication.sharedApplication().servicesProvider = self
        NSUpdateDynamicServices()
    }
    
    func serviceHandler(pasteboard: NSPasteboard, userData: String, error: NSErrorPointer) {
        let selectedString: String! = pasteboard.stringForType(NSPasteboardTypeString)
        if (count(selectedString) > 0) {
            NSApplication.sharedApplication().activateIgnoringOtherApps(true)
            self.delegate.dict.beginRequest(selectedString)
        }
    }
}
