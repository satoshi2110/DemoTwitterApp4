//
//  ViewController.swift
//  DemoTwitterApp4
//
//  Created by N S on 2025/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var tweetDataList: [TweetDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        setTweetData()
    }
    
    func setTweetData() {
        for i in 1...5 {
            let tweetDataModel = TweetDataModel(user: "ユーザー名", tweet: "\(i)ツイート")
            tweetDataList.append(tweetDataModel)
        }
    }
    
}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let tweetDataModel: TweetDataModel = tweetDataList[indexPath.row]
        cell.textLabel?.text = tweetDataModel.tweet
        return cell
    }
    
    
}
