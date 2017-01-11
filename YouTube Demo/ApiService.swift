//
//  ApiService.swift
//  YouTube Demo
//
//  Created by Chashmeet Singh on 11/01/17.
//  Copyright © 2017 Chashmeet Singh. All rights reserved.
//

import UIKit

class ApiService: NSObject {

    static let sharedInstance = ApiService()
    
    func fetchVideos(completion: @escaping ([Video]) -> Void) {
        let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error ?? "error")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                var videos = [Video]()
                
                for dictionary in json as! [[String : AnyObject]] {
                    let video = Video()
                    video.title = dictionary["title"] as? String
                    video.numberOfViews = dictionary["number_of_views"] as? NSNumber
                    video.duration = dictionary["duration"] as? NSNumber
                    video.thumnnailImageName = dictionary["thumbnail_image_name"] as? String
                    
                    let channelDictionary = dictionary["channel"] as! [String : AnyObject]
                    
                    let channel = Channel()
                    channel.name = channelDictionary["name"] as? String
                    channel.profileImagename = channelDictionary["profile_image_name"] as? String
                    
                    video.channel = channel
                    
                    videos.append(video)
                }
                
                DispatchQueue.main.async {
                    completion(videos)
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
        }).resume()
    }
    
}
