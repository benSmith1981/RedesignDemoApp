//
//  ViewController.swift
//  ReignDesignDemo
//
//  Created by Ben Smith on 28/09/2015.
//  Copyright (c) 2015 Ben Smith. All rights reserved.
//

import UIKit
import Alamofire

class HackerNewsTableViewController: UITableViewController {

    let baseURL: String = "http://hn.algolia.com/api/v1/search_by_date?query=ios"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

//        HackerNewsDataController.loadDataFromURL(NSURL(string: baseURL)!, completion: { (data, error) -> Void in
//            println(data)
//        })
        HackerNewsDataController.loadFeed(baseURL, completion: { (hackerData, error) -> Void in
            println(hackerData)

        })
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK UITableview methods
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("NewsCell", forIndexPath: indexPath) as! UITableViewCell
        let row = indexPath.row
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
}

