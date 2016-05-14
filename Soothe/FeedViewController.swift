//
//  FeedViewController.swift
//  Soothe
//
//  Created by Gale on 3/25/16.
//  Copyright © 2016 Gale. All rights reserved.
//

import UIKit
import AFNetworking
import Gifu

class FeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var gifs: [Gif]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        giphyCall()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Network Calls
    func giphyCall() {
//        GiphyClient().getTrendingWithCompletion { (gifs, error) -> () in
//            
//            if error == nil {
//                self.gifs = gifs
//                self.tableView.reloadData()
//            } else {
//                print("\(error)")
//            }
//            
//        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - UITableViewDataSouce & UITableViewDelegate

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if section == 0 {
            return 5
        } else {
            return 10;
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell
        if (indexPath.section == 0) {
            let gifCell = tableView.dequeueReusableCellWithIdentifier("GiphyCell") as! GiphyCell
            gifCell.backgroundColor = UIColor.blueColor();
//            gifCell.giphyImageView.animateWithImageData(NSData(contentsOfURL: NSURL(string: gifs![indexPath.row].gifUrl!)!)!)
            cell = gifCell;
        } else {
            let sampleCell = tableView.dequeueReusableCellWithIdentifier(SampleCell.reuseIdentifier(), forIndexPath: indexPath);
            
            cell = sampleCell
        }

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
