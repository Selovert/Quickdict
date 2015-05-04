//
//  StatusItemDelegate.swift
//  Quickdict
//
//  Created by Tassilo Selover-Stephan on 12/03/15.
//  Copyright (c) 2015 Tassilo Selover-Stephan. All rights reserved.
//

import Cocoa
import AppKit

class StatusItemDelegate: NSObject {
    let delegate: AppDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
    var button: NSStatusBarButton
    
    override init() {
        button = delegate.statusItem.button!
        button.image = NSBundle.mainBundle().imageForResource("icon")
        super.init()
        button.sendActionOn((2 | 8))
        button.target = self
        button.action = Selector("clicked")
        self.setUpLanguageMenu()
    }
    
    func setUpLanguageMenu() {
        for display in delegate.globals.languageOptions {
            let newItem: NSMenuItem = NSMenuItem(title: display, action: Selector("changeLanguage:"), keyEquivalent: "")
            newItem.target = self
            delegate.languageMenu.addItem(newItem)
        }
        let (currentDisplay, currentSubdomain): (String, String) = delegate.globals.currentLanguage
        delegate.languageMenu.itemWithTitle(currentDisplay)!.state = NSOnState
    }
    
    func changeLanguage(sender: NSMenuItem) {
        let (currentDisplay, currentSubdomain): (String, String) = delegate.globals.currentLanguage
        delegate.languageMenu.itemWithTitle(currentDisplay)!.state = NSOffState
        sender.state = NSOnState
        let title = sender.title
        delegate.globals.currentLanguage = (title, delegate.globals.availableLanguages[title]!)
    }
    
    func changeIcon(icon: String, setToDefault: Bool) {
        if (delegate.globals.currentImage != icon) {
            let image: NSImage = NSBundle.mainBundle().imageForResource(icon)!
            delegate.statusItem.image = image
            if (setToDefault == true) {
                delegate.globals.defaultImage = icon
            }
        }
        delegate.globals.currentImage = icon
    }
    
    func clicked() {
        let currentEvent: NSEvent! = NSApp.currentEvent
        let eventType: NSEventType = currentEvent.type
        if eventType == NSEventType.RightMouseDown {
            delegate.statusItem.highlightMode = false
            self.handleRightClick()
        } else if eventType == NSEventType.LeftMouseDown {
            delegate.statusItem.highlightMode = true
            self.openMenu()
        }
    }
    
    func openMenu() {
        delegate.statusItem.popUpStatusItemMenu(delegate.statusMenu)
    }
    
    func handleRightClick() {
        let pasteboard: NSPasteboard = NSPasteboard.generalPasteboard()
        let pasteboardString: NSString! = pasteboard.stringForType(NSPasteboardTypeString)
        print(pasteboardString)
    }

}
