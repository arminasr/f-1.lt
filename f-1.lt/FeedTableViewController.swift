//
//  FeedTableViewController.swift
//  f-1.lt
//
//  Created by Arminas on 02/10/2016.
//  Copyright © 2016 Arminas. All rights reserved.
//

import UIKit
import KINWebBrowser
import MWFeedParser

class FeedTableViewController: UITableViewController, MWFeedParserDelegate {
    
    var feedItems = [MWFeedItem]()
    
    func request(){
        print("asd")
        let url = NSURL(string: "http://feeds.feedburner.com/f-1-lt")
        let feedParser = MWFeedParser(feedURL: url as URL!)!
        
        feedParser.delegate = self
        feedParser.parse()
    }
    
    //MARK: - FeedParser delegate
    
    func feedParserDidStart(_ parser: MWFeedParser!) {
        feedItems = [MWFeedItem]()
        
    }
    
    func feedParserDidFinish(_ parser: MWFeedParser!) {
        self.tableView.reloadData()
    }
    
    func feedParser(_ parser: MWFeedParser!, didParseFeedInfo info: MWFeedInfo!) {
        print(info)
        self.title = info.title
    }
    
    func feedParser(_ parser: MWFeedParser!, didParseFeedItem item: MWFeedItem!) {
        feedItems.append(item)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        request()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> FeedTableViewCell {
        let cell : FeedTableViewCell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! FeedTableViewCell
        
        

        let item = feedItems[indexPath.row] as MWFeedItem
        cell.feedTitle.text = item.title
        cell.feedContent.text = item.summary

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = feedItems[indexPath.row] as MWFeedItem
    }
    
    

}
