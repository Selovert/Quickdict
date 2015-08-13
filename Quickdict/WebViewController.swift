//
//  WebViewController.swift
//  Quickdict
//
//  Created by Tassilo Selover-Stephan on 13/08/15.
//  Copyright (c) 2015 Tassilo Selover-Stephan. All rights reserved.
//

import Cocoa
import WebKit

class WebViewController: NSWindowController, NSWindowDelegate {

    @IBOutlet var webViewWindow: NSWindow!
    @IBOutlet var webView: WebView!
    var script = String(contentsOfFile: NSBundle.mainBundle().pathForResource("sanitize-page", ofType: "js")!, encoding: NSUTF8StringEncoding, error: nil)!
    
    override func windowDidLoad() {
        webViewWindow.delegate = self
        super.windowDidLoad()
    }
    
    func windowDidResignKey(notification: NSNotification) {
        self.close()
        NSURLCache.sharedURLCache().removeAllCachedResponses()
        webView.mainFrame.loadHTMLString("", baseURL: nil)
        webView.stopLoading(nil)
        webView.removeFromSuperview()
        webView.resourceLoadDelegate = nil
        webView.frameLoadDelegate = nil
        webView = nil
    }
    
    func reveal(url: NSURL) {
        NSBundle.mainBundle().loadNibNamed("WebViewWindowController", owner: self, topLevelObjects: nil)
        self.showWindow(self)
        self.webView.mainFrame.loadRequest(NSURLRequest(URL: url))
        self.webView.frameLoadDelegate = self
        self.webView.resourceLoadDelegate = self
        NSApp.activateIgnoringOtherApps(true)
        webViewWindow.makeKeyAndOrderFront(self)
    }
    
    override func webView(sender: WebView!, didFinishLoadForFrame frame: WebFrame!) {
        webView.stringByEvaluatingJavaScriptFromString(script)
    }
    
}

