//
//  ViewController.swift
//  DemoTwitterApp4
//
//  Created by N S on 2025/01/24.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var tweetDataList: [TweetDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        setupFloatingButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTweetData()
        tableView.reloadData()
    }
    
    func setTweetData() {
        let realm = try! Realm()
        let result = realm.objects(TweetDataModel.self)
        tweetDataList = Array(result)
    }
    func setupFloatingButton() {
        let floatingButton = UIButton(type: .system)
        floatingButton.frame = CGRect(x: view.frame.width - 70, y: view.frame.height - 150, width: 60, height: 60)
        floatingButton.backgroundColor = .systemBlue
        floatingButton.tintColor = .white
        floatingButton.setTitle("+", for: .normal)
        floatingButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        floatingButton.layer.cornerRadius = 30
        floatingButton.layer.shadowColor = UIColor.black.cgColor
        floatingButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        floatingButton.layer.shadowOpacity = 0.3
        floatingButton.layer.shadowRadius = 4
        floatingButton.addTarget(self, action: #selector(floatingButtonTapped), for: .touchUpInside)

        view.addSubview(floatingButton)
    }

    @objc func floatingButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tweetDetailViewController = storyboard.instantiateViewController(withIdentifier: "TweetDetailViewController") as! TweetDetailViewController

        // 初期データを設定
        let newTweetData = TweetDataModel()
        newTweetData.user = "ユーザー名"
        newTweetData.tweet = "新しいツイート"
        tweetDetailViewController.configure(tweetData: newTweetData)

        navigationController?.pushViewController(tweetDetailViewController, animated: true)
    }
    
    func deleteCell(at indexPath: IndexPath) {
        let realm = try! Realm()
        let targetTweet = tweetDataList[indexPath.row]
        try! realm.write {
            realm.delete(targetTweet)
        }
        tweetDataList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }

    func editCell(at indexPath: IndexPath) {
        let tweetData = tweetDataList[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tweetDetailViewController = storyboard.instantiateViewController(withIdentifier: "TweetDetailViewController") as! TweetDetailViewController

        tweetDetailViewController.configure(tweetData: tweetData)
        navigationController?.pushViewController(tweetDetailViewController, animated: true)
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
