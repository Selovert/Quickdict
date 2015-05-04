//
//  SearchBarController.swift
//  Quickdict
//
//  Created by Tassilo Selover-Stephan on 16/03/15.
//  Copyright (c) 2015 Tassilo Selover-Stephan. All rights reserved.
//

import Cocoa

class SearchBarController: NSWindowController, NSWindowDelegate, NSTextFieldDelegate {

    let delegate: AppDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
    @IBOutlet var searchBarWindow: SearchBarWindow!
    @IBOutlet var vibrantView: NSVisualEffectView!
    @IBOutlet var searchField: NSTextField!
    
    override init(window: NSWindow!) {
        super.init(window: window)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func windowDidLoad() {
        searchBarWindow.delegate = self
        searchBarWindow.contentView = vibrantView
        vibrantView.wantsLayer = true
        vibrantView.layer!.cornerRadius = 5
        searchBarWindow.invalidateShadow()
        
        searchField.drawsBackground = false
        searchField.bezeled = false
        searchField.focusRingType = NSFocusRingType.None
        searchField.delegate = self
    }
    
    func windowDidResignMain(notification: NSNotification) {
        self.closeWindow()
    }
    
    func control(control: NSControl, textView: NSTextView, doCommandBySelector commandSelector: Selector) -> Bool {
        if commandSelector == Selector("cancelOperation:") {
            self.closeWindow()
        }
        return false
    }
    
    func closeWindow() {
        self.close()
        searchField.stringValue = ""
    }
    
    func centerWindow() {
        let mainScreen: NSScreen! = NSScreen.mainScreen()
        let x: CGFloat = ceil(mainScreen.frame.origin.x + (mainScreen.frame.width/2) - (searchBarWindow.frame.width/2))
        let y: CGFloat = ceil(mainScreen.frame.origin.y + (mainScreen.frame.height/1.5) - (searchBarWindow.frame.height/2))
        self.window!.setFrame(CGRectMake(x, y, searchBarWindow.frame.width, searchBarWindow.frame.height), display: true)
        self.window!.styleMask = NSBorderlessWindowMask
    }
    
    @IBAction func search(sender: AnyObject) {
        if (count(searchField.stringValue) > 0) {
            self.delegate.dict.beginRequest(searchField.stringValue)
        }
        self.closeWindow()
    }
    

}
