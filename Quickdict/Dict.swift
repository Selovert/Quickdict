//
//  Dict.swift
//  Quickdict
//
//  Created by Tassilo Selover-Stephan on 19/03/15.
//  Copyright (c) 2015 Tassilo Selover-Stephan. All rights reserved.
//

import Cocoa

class Dict: NSObject {
    let delegate: AppDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
    
    func beginRequest(searchQuery: String) {
        let (currentDisplay, currentSubdomain): (String, String) = delegate.globals.currentLanguage
        let url: NSURL! = NSURL(string: "http://\(currentSubdomain).dict.cc/?s=\(searchQuery)".stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)
        NSWorkspace.sharedWorkspace().openURL(url)
    }
}
