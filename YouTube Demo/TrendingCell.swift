//
//  TrendingCell.swift
//  YouTube Demo
//
//  Created by Chashmeet Singh on 11/01/17.
//  Copyright © 2017 Chashmeet Singh. All rights reserved.
//

import UIKit

class TrendingCell: FeedCell {

    override func fetchVideos() {
        ApiService.sharedInstance.fetchTrendingFeed(completion: { (videos: [Video]) in
            self.videos = videos
            self.collectionView.reloadData()
        })
    }

}
