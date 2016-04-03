//
//  HackNewsModel.swift
//  ReignDesignDemo
//
//  Created by Ben Smith on 28/09/2015.
//  Copyright (c) 2015 Ben Smith. All rights reserved.
//

import Foundation
struct HackerNewsModel {
    var createdTimeStamp: String
    var author: String
    var storyID:String
    var storyTitle: String
    var storyURL: String
    
    init(hackerData: HackerData) {
        createdTimeStamp = hackerData["created_at_i"] as! String
        author = hackerData["author"] as! String
        storyID = hackerData["story_id"] as! String
        storyTitle = hackerData["story_title"] as! String
        storyURL = hackerData["story_url"] as! String
    }
}