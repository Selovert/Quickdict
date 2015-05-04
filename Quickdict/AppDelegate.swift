//
//  AppDelegate.swift
//  Quickdict
//
//  Created by Tassilo Selover-Stephan on 12/03/15.
//  Copyright (c) 2015 Tassilo Selover-Stephan. All rights reserved.
//

import Cocoa
import MASShortcut

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var languageMenu: NSMenu!
    
    let kPreferenceGlobalShortcut: NSString = "GlobalShortcut"
    var statusItem: NSStatusItem!
    var statusItemDelegate: StatusItemDelegate!
    var servicesDelegate: ServicesDelegate!
    var hotkeyPopoverController: HotkeyPopoverController!
    var searchBarController: SearchBarController!
    var aboutWindowController: AboutWindowController!
    var globals: Globals!
    var dict: Dict!

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        globals = Globals()
        statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1);
        statusItemDelegate = StatusItemDelegate()
        dict = Dict()
        
        servicesDelegate = ServicesDelegate()
        searchBarController = SearchBarController(windowNibName: "SearchBar")
        searchBarController.showWindow(searchBarController)
        searchBarController.close()
        self.setUpHotkey()
        
        aboutWindowController = AboutWindowController(windowNibName: "AboutWindow")
}
    
    func setUpHotkey() {
        let shortcut: MASShortcut = MASShortcut(keyCode:49, modifierFlags:1179648)
        let shortcutData: NSData = NSKeyedArchiver.archivedDataWithRootObject(shortcut)
        let defaultDict: Dictionary = [kPreferenceGlobalShortcut: shortcutData]
        NSUserDefaults.standardUserDefaults().registerDefaults(defaultDict)
        hotkeyPopoverController = HotkeyPopoverController(nibName: "HotkeyPopoverController", bundle: NSBundle.mainBundle())
        MASShortcutBinder.sharedBinder().bindShortcutWithDefaultsKey(kPreferenceGlobalShortcut as String, toAction: { () -> Void in
            self.handleHotkey()
        })
    }
    
    func handleHotkey() {
        if (searchBarController.searchBarWindow.mainWindow) {
            searchBarController.close()
        } else {
            searchBarController.centerWindow()
            searchBarController.showWindow(searchBarController)
        }
        NSApplication.sharedApplication().activateIgnoringOtherApps(true)
    }
    
    func applicationWillTerminate(notification: NSNotification) {
        globals.saveSettings()
    }
    
    @IBAction func openAboutWindow(sender: AnyObject) {
        self.aboutWindowController.reveal()
    }
    
    @IBAction func changeHotkey(sender: AnyObject) {
        if hotkeyPopoverController.popover.shown {
            hotkeyPopoverController.popover.close()
        }
        hotkeyPopoverController.popover.showRelativeToRect(statusItem!.button!.frame, ofView: statusItem.button!, preferredEdge: NSMinYEdge)
        
    }
        
}