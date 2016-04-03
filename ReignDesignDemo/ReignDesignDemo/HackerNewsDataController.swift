//
//  HackerNewsDataController.swift
//  ReignDesignDemo
//
//  Created by Ben Smith on 28/09/2015.
//  Copyright (c) 2015 Ben Smith. All rights reserved.
//

import Foundation

let hackerNewsPath = "http://hn.algolia.com/api/v1/search_by_date?query=ios"

typealias APIResponse = (Bool) -> Void
typealias APIServiceResponse = (UserData?, NSError?) -> Void

class HackerNewsDataController {
    
    static let sharedInstance = HackerNewsDataController()
    
    private init() {}
    
    func loadFeed(onCompletion: APIResponse) {
        
    }
    
    func makeLoadrequest(path: String, onCompletion: APIServiceResponse){
        let session = NSURLSession.sharedSession()
        let request = NSMutableURLRequest(URL: NSURL(string: path))
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        
        
    }
}