//
//  Globals.swift
//  Quickdict
//
//  Created by Tassilo Selover-Stephan on 13/03/15.
//  Copyright (c) 2015 Tassilo Selover-Stephan. All rights reserved.
//

import Cocoa

class Globals: NSObject {
    
    var autoLaunch: Int
    var defaultImage: String
    var currentImage: String
    var currentLanguage: (String, String)
    
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()

    override init() {
        autoLaunch = 0
        defaultImage = "menubar-icon"
        currentImage = ""
        currentLanguage = ("DE <> EN", "DEEN")
        super.init()
        self.loadSettings()
    }
    
    func saveSettings() {
        defaults.setInteger(self.autoLaunch, forKey: "autoLaunch")
        println("Saving settings...")
        defaults.synchronize()
    }
    
    func loadSettings() {
        autoLaunch = defaults.integerForKey("autoLaunch")
    }
    
    var availableLanguages: [String:String] = [
        "DE <> EN":"DEEN",
        "DE –> EN":"DE-EN",
        "EN –> DE":"EN-DE",
        "DE <> BG":"DEBG",
        "DE <> BS":"DEBS",
        "DE <> CS":"DECS",
        "DE <> DA":"DEDA",
        "DE <> EL":"DEEL",
        "DE <> EO":"DEEO",
        "DE <> ES":"DEES",
        "DE <> FI":"DEFI",
        "DE <> FR":"DEFR",
        "DE <> HR":"DEHR",
        "DE <> HU":"DEHU",
        "DE <> IS":"DEIS",
        "DE <> IT":"DEIT",
        "DE <> LA":"DELA",
        "DE <> NL":"DENL",
        "DE <> NO":"DENO",
        "DE <> PL":"DEPL",
        "DE <> PT":"DEPT",
        "DE <> RO":"DERO",
        "DE <> RU":"DERU",
        "DE <> SK":"DESK",
        "DE <> SQ":"DESQ",
        "DE <> SR":"DESR",
        "DE <> SV":"DESV",
        "DE <> TR":"DETR",
        "EN <> BG":"ENBG",
        "EN <> BS":"ENBS",
        "EN <> CS":"ENCS",
        "EN <> DA":"ENDA",
        "EN <> EL":"ENEL",
        "EN <> EO":"ENEO",
        "EN <> ES":"ENES",
        "EN <> FI":"ENFI",
        "EN <> FR":"ENFR",
        "EN <> HR":"ENHR",
        "EN <> HU":"ENHU",
        "EN <> IS":"ENIS",
        "EN <> IT":"ENIT",
        "EN <> LA":"ENLA",
        "EN <> NL":"ENNL",
        "EN <> NO":"ENNO",
        "EN <> PL":"ENPL",
        "EN <> PT":"ENPT",
        "EN <> RO":"ENRO",
        "EN <> RU":"ENRU",
        "EN <> SK":"ENSK",
        "EN <> SQ":"ENSQ",
        "EN <> SR":"ENSR",
        "EN <> SV":"ENSV",
        "EN <> TR":"ENTR"
    ]
    var languageOptions: [String] = [
        "DE <> EN",
        "DE –> EN",
        "EN –> DE",
        "DE <> BG",
        "DE <> BS",
        "DE <> CS",
        "DE <> DA",
        "DE <> EL",
        "DE <> EO",
        "DE <> ES",
        "DE <> FI",
        "DE <> FR",
        "DE <> HR",
        "DE <> HU",
        "DE <> IS",
        "DE <> IT",
        "DE <> LA",
        "DE <> NL",
        "DE <> NO",
        "DE <> PL",
        "DE <> PT",
        "DE <> RO",
        "DE <> RU",
        "DE <> SK",
        "DE <> SQ",
        "DE <> SR",
        "DE <> SV",
        "DE <> TR",
        "EN <> BG",
        "EN <> BS",
        "EN <> CS",
        "EN <> DA",
        "EN <> EL",
        "EN <> EO",
        "EN <> ES",
        "EN <> FI",
        "EN <> FR",
        "EN <> HR",
        "EN <> HU",
        "EN <> IS",
        "EN <> IT",
        "EN <> LA",
        "EN <> NL",
        "EN <> NO",
        "EN <> PL",
        "EN <> PT",
        "EN <> RO",
        "EN <> RU",
        "EN <> SK",
        "EN <> SQ",
        "EN <> SR",
        "EN <> SV",
        "EN <> TR"
    ]
}
