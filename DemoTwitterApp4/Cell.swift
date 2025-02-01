//
//  Cell.swift
//  DemoTwitterApp4
//
//  Created by N S on 2025/01/24.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var tweet: UILabel!
    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var tweetView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
    }
    
    @IBAction func editButton(_ sender: UIButton) {
    }
}
