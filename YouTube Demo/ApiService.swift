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
    
    let baseUrl = "https://s3-us-west-2.amazonaws.com/youtubeassets"
    
    func fetchVideos(completion: @escaping ([Video]) -> Void) {
        fetchVideosForUrl(url: "\(baseUrl)/home_num_likes.json", completion: completion)
    }
    
    func fetchTrendingFeed(completion: @escaping ([Video]) -> Void) {
        fetchVideosForUrl(url: "\(baseUrl)/trending.json", completion: completion)
    }
    
    func fetchSubscriptionFeed(completion: @escaping ([Video]) -> Void) {
        fetchVideosForUrl(url: "\(baseUrl)/subscriptions.json", completion: completion)
    }
    
    func fetchVideosForUrl(url: String, completion: @escaping ([Video]) -> Void) {
        let url = URL(string: url)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            if let error = error {
                print(error)
                return
            }
            
            do {
                if let data = data,
                    let jsonDictionaries = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String : AnyObject]] {
                    
                    DispatchQueue.main.async {
                        completion(jsonDictionaries.map({return Video(dictionary: $0)}))
                    }
                    
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
        }).resume()
    }
    
}
