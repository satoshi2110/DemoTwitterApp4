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
        tableView.delegate = self
        tableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        setTweetData()
        
    }
    
    
    func setTweetData() {
        for i in 1...10 {
            let tweetDataModel = TweetDataModel(user: "ユーザー名", tweet: "\(i)ツイート")
            tweetDataList.append(tweetDataModel)
        }
        print("データ: \(tweetDataList)")
    }
}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! Cell
        let tweetDataModel: TweetDataModel = tweetDataList[indexPath.row]
        cell.tweet.text = tweetDataModel.tweet
        cell.user.text = tweetDataModel.user
        
        return cell
    }
    
}
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let tweetDetailViewController = storybord.instantiateViewController(withIdentifier: "TweetDetailViewController") as! TweetDetailViewController
//        データを送る
        let tweetData = tweetDataList[indexPath.row]
        tweetDetailViewController.configure(tweetData: tweetData)
//        選択したセルを消す
        tableView.deselectRow(at: indexPath, animated: true)
//        移動
        navigationController?.pushViewController(tweetDetailViewController, animated: true)
    }
}
