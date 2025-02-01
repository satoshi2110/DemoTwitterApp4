//
//  tweetDetailViewController.swift
//  DemoTwitterApp4
//
//  Created by N S on 2025/01/25.
//

import UIKit

class TweetDetailViewController: UIViewController {
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var tweetTextView: UITextView!
    
    var user: String = ""
    var tweet: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
    }
    
    func configure(tweetData: TweetDataModel) {
        user = tweetData.user
        tweet = tweetData.tweet
        print("データは\(user)と\(tweet)です")
    }
    
    func displayData() {
        userLabel.text = user
        tweetTextView.text = tweet
    }
}

