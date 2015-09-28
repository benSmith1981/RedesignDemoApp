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
    
    class func loadFeed(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        Alamofire.request(.GET, "http://hn.algolia.com/api/v1/search_by_date?query=ios").responseJSON() {
            (request, response, data, responseError) in
            println(data)
            completion(data: nil, error: responseError)
        }
    }
}