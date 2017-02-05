//
//  Video.swift
//  YouTube Demo
//
//  Created by Chashmeet Singh on 06/01/17.
//  Copyright © 2017 Chashmeet Singh. All rights reserved.
//

import UIKit

class Video: SafeJsonObject {
    
    var thumbnail_image_name: String?
    var title: String?
    var number_of_views: NSNumber?
    var duration: NSNumber?
    
    var channel: Channel?
    
    override func setValue(_ value: Any?, forKey key: String) {
        
        if key == "channel" {
            self.channel = Channel()
            self.channel?.setValuesForKeys(value as! [String : AnyObject])
            
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    init(dictionary: [String : AnyObject]) {
        super.init()
        setValuesForKeys(dictionary)
    }
    
}
