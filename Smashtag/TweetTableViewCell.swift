//
//  TweetTableViewCell.swift
//  Smashtag
//
//  Created by DAVID VELA TIRADO on 09/04/15.
//  Copyright (c) 2015 DAVID VELA TIRADO. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    var tweet :Tweet? {
        didSet{
            updateUI()
        }
    }
    
    @IBOutlet weak var tweetProfileImageView: UIImageView!
    @IBOutlet weak var tweetScreenNameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!

    func updateUI(){
        //reset any existence tweet information
        tweetTextLabel?.attributedText = nil
        tweetScreenNameLabel?.text = nil
        tweetProfileImageView?.image = nil
//        tweetCreatedLabel?.text = nil
        
        //load new information from our tweet
        if let tweet = self.tweet {
            tweetTextLabel?.text = tweet.text
            for _ in tweet.media {
                tweetTextLabel.text! += " . "
            }
        }
        
        
        tweetScreenNameLabel?.text = "\(tweet?.user)"
        
        if let profileImageURL = tweet?.user.profileImageURL {
            if let imageData = NSData(contentsOfURL: profileImageURL){ //block main thread!!!
                tweetProfileImageView?.image = UIImage(data: imageData)
            }
        }
        
//        let formatter = NSDateFormatter()
//        if NSDate().timeIntervalSinceDate(tweet?.created) > 24*60*60 {
//            formatter.dateStyle = NSDateFormatterStyle.ShortStyle
//        } else {
//            formatter.timeStyle = NSDateFormatterStyle.ShortStyle
//        }
//        tweetCreatedLabel.text = formatter.stringFromDate(tweet?.created)
        
        
        
    }
    
}//END CLASS
