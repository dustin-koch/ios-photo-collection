//
//  ThemeHelper.swift
//  Photo Collection
//
//  Created by Dustin Koch on 1/23/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import Foundation


class ThemeHelper {
    
    let themePreferenceKey: String = "key"
    
    init(){
        if themePreference == nil {
            setThemePreferenceToIce()
        } else { return }
    }
    
    func setThemePreferenceToDark() {
        
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToIce() {
        UserDefaults.standard.set("Ice", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {

        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
}


//var imageData: Data
//var title: String
