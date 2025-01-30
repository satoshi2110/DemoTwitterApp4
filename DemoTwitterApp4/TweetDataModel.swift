//
//  TweetDataModel.swift
//  DemoTwitterApp4
//
//  Created by N S on 2025/01/24.
//

import Foundation
import RealmSwift

class TweetDataModel: Object {
    @Persisted var id: String = UUID().uuidString
    @Persisted var user: String = ""
    @Persisted var tweet: String = ""
}
