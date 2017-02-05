//
//  SafeJsonObject.swift
//  YouTube Demo
//
//  Created by Chashmeet Singh on 05/02/17.
//  Copyright © 2017 Chashmeet Singh. All rights reserved.
//

import UIKit

class SafeJsonObject: NSObject {
    
    override func setValue(_ value: Any?, forKey key: String) {
        let uppercasedFirstString = String(key.characters.first!).uppercased()
        
        let range = key.startIndex..<key.characters.index(key.startIndex, offsetBy: 1)
        let selectorString = key.replacingCharacters(in: range, with: uppercasedFirstString)
        
        let selector = NSSelectorFromString("set\(selectorString):")
        let responds = self.responds(to: selector)
        
        if !responds {
            return
        }
        
        super.setValue(value, forKey: key)
    }
    
}
