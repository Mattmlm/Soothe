//
//  GiphyClient.swift
//  Soothe
//
//  Created by Gale on 3/30/16.
//  Copyright © 2016 Gale. All rights reserved.
//

import UIKit

let delegate = UIApplication.sharedApplication().delegate as! AppDelegate

class GiphyClient {
    
    let publicKey = delegate.retrieveKeys("giphyKey")
    var searchTerm = " "
    
    var loginCompletion: ((gif: Gif?, error: NSError?) -> ())?
    var gifs: [Gif]?
    
    func getSearchWithCompletion(completion: (gifs: [Gif]?, error: NSError?) -> ()) {
        let url = NSURL(string:"http://api.giphy.com/v1/gifs/search?q=\(searchTerm)&api_key=\(publicKey)")
        
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                        
                            if (responseDictionary["data"] != nil ) {
                                
                                self.gifs = Gif.gifsWithArray(responseDictionary["data"] as! [NSDictionary])
                                completion(gifs: self.gifs, error: nil)
                            } else {
                                print(error)
                                completion(gifs: nil, error: error)
                            }
                    } else {
                        completion(gifs: nil, error: error)
                    }
                } else {
                    completion(gifs: nil, error: error)
                }
        });
        task.resume()
    }
    
    func getTrendingWithCompletion(completion: (gifs: [Gif]?, error: NSError?) -> ()) {
        let url = NSURL(string:"http://api.giphy.com/v1/gifs/trending?api_key=\(publicKey)")
        
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                            //print(responseDictionary)
                            if (responseDictionary["data"] != nil ) {
                                print(responseDictionary["data"])
                                self.gifs = Gif.gifsWithArray(responseDictionary["data"] as! [NSDictionary])
                                
                                print("Connection to API successful!")
                                completion(gifs: self.gifs, error: nil)
                            }
                            else {
                                print("error")
                                completion(gifs: nil, error: error)
                            }
                    } else { completion(gifs: nil, error: error) }
                } else { completion(gifs: nil, error: error) }
        });
        task.resume()
    }

}
