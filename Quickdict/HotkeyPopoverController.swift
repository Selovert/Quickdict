//
//  HotkeyPopoverController.swift
//  Quickdict
//
//  Created by Tassilo Selover-Stephan on 15/03/15.
//  Copyright (c) 2015 Tassilo Selover-Stephan. All rights reserved.
//

import Cocoa
import MASShortcut

class HotkeyPopoverController: NSViewController {
    
    @IBOutlet var shortcutView: MASShortcutView!
    let delegate: AppDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
    var popover: NSPopover = NSPopover()
    
    override init?(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        popover.contentViewController = self
        popover.behavior = NSPopoverBehavior.Transient
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidAppear() {
        MASShortcutBinder.sharedBinder().breakBindingWithDefaultsKey(delegate.kPreferenceGlobalShortcut as String)
        shortcutView.associatedUserDefaultsKey = delegate.kPreferenceGlobalShortcut as String
        NSApplication.sharedApplication().activateIgnoringOtherApps(true)
        super.viewDidAppear()
    }
    
    override func viewDidDisappear() {
        MASShortcutBinder.sharedBinder().bindShortcutWithDefaultsKey(delegate.kPreferenceGlobalShortcut as String, toAction: { () -> Void in
            self.delegate.handleHotkey()
        })
        super.viewDidDisappear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}