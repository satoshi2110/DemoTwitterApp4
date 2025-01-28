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
    
    var tweetBarButtonItem: UIBarButtonItem!
    var cancelBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
        
        // ナビゲーションバーのボタン設定
        tweetBarButtonItem = UIBarButtonItem(title: "投稿する", style: .done, target: self, action: #selector(tweetBarButtonTapped(_:)))
        cancelBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBarButtonTapped(_:)))
        
        // ナビゲーションバーにボタンを追加
        self.navigationItem.rightBarButtonItems = [tweetBarButtonItem]
        self.navigationItem.leftBarButtonItems = [cancelBarButtonItem]
        
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
    
    @objc func tweetBarButtonTapped(_ sender: UIBarButtonItem) {
        print("【投稿する】ボタンが押されました!")
        
        // ViewController に戻る
        navigationController?.popViewController(animated: true)
    }
    
    @objc func cancelBarButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}

