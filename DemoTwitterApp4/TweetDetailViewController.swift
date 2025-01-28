//
//  tweetDetailViewController.swift
//  DemoTwitterApp4
//
//  Created by N S on 2025/01/25.
//

import UIKit
import RealmSwift

class TweetDetailViewController: UIViewController {
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var tweetTextView: UITextView!
    
    var tweetDataModel = TweetDataModel()
    
    var tweetBarButtonItem: UIBarButtonItem!
    var cancelBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
        tweetTextView.delegate = self
        // ナビゲーションバーのボタン設定
        tweetBarButtonItem = UIBarButtonItem(title: "投稿する", style: .done, target: self, action: #selector(tweetBarButtonTapped(_:)))
        cancelBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBarButtonTapped(_:)))
        
        // ナビゲーションバーにボタンを追加
        self.navigationItem.rightBarButtonItems = [tweetBarButtonItem]
        self.navigationItem.leftBarButtonItems = [cancelBarButtonItem]
        
    }
    
    func configure(tweetData: TweetDataModel) {
        tweetDataModel.user = tweetData.user
        tweetDataModel.tweet = tweetData.tweet
        print("データは\(tweetDataModel.user)と\(tweetDataModel.tweet)です")
    }
    
    func displayData() {
        userLabel.text = tweetDataModel.user
        tweetTextView.text = tweetDataModel.tweet
    }
    
    func saveData(with text: String) {
        let realm = try! Realm()
        try! realm.write {
            tweetDataModel.tweet = text
            realm.add(tweetDataModel)
        }
        print(tweetDataModel.tweet)
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

extension TweetDetailViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let updaedtext = tweetTextView.text ?? ""
        saveData(with: updaedtext)
    }
}

