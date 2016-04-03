//
//  HackerNewsDataController.swift
//  ReignDesignDemo
//
//  Created by Ben Smith on 28/09/2015.
//  Copyright (c) 2015 Ben Smith. All rights reserved.
//

import Foundation

let hackerNewsPath = "http://hn.algolia.com/api/v1/search_by_date?query=ios"
public typealias HackerData = [String: AnyObject]

typealias APIResponse = (Bool) -> Void
typealias APIServiceResponse = (HackerData?, NSError?) -> Void

class HackerNewsDataController {
    
    static let sharedInstance = HackerNewsDataController()
    var newHackerData: HackerNewsModel? //struct to hold data we get back
    private var hackerInfoDict:HackerData = [:] //dictionary to hold data from json

    private init() {}
    
    func loadFeed(onCompletion: APIResponse) {
        makeLoadrequest(hackerNewsPath, onCompletion: { json, err in
            if let json = json {
                //store the json in an object
                self.newHackerData = HackerNewsModel.init(hackerData: json)
                onCompletion(true)
            } else {
                onCompletion(false)
            }
        })
    }
    
    func makeLoadrequest(path: String, onCompletion: APIServiceResponse){
        let session = NSURLSession.sharedSession()
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        request.HTTPMethod = "GET"
        
        let task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            do {
                let jsonObject = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
                if let dict = jsonObject as? [String: AnyObject] {
                    if dict.count == 0 { //we get a response of nothing returned
                        onCompletion(nil, nil)
                    } else {
                        self.hackerInfoDict = dict //use this so the unit test has access to data returned
                        onCompletion(dict, nil)
                    }
                }
                
            }catch {
                print("error serializing JSON: \(error)")
                onCompletion(nil, nil)
            }
        })
        task.resume()
        
    }
}