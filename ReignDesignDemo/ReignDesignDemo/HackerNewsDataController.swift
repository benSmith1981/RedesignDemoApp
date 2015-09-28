//
//  HackerNewsDataController.swift
//  ReignDesignDemo
//
//  Created by Ben Smith on 28/09/2015.
//  Copyright (c) 2015 Ben Smith. All rights reserved.
//

import Foundation
import Alamofire

class HackerNewsDataController {
    
    class func loadFeed(url: String, completion:(data: JSON?, error: NSError?) -> Void) {
        Alamofire.request(.GET, url).responseJSON { (request, response, JSONData, error) in
            if(error != nil) {
                NSLog("Error: \(error)")
                completion(data: nil, error: error)
            }
            else {
                NSLog("Success: \(url)")
                var json = JSON(JSONData!) //Uses swiftyJSON to serialise the returned data
                completion(data: json, error: nil) //Completes with success
            }
        }
    }
}