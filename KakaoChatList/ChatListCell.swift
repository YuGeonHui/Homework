//
//  ChatListCell.swift
//  UIKitStudy
//
//  Created by geonhui Yu on 2022/09/10.
//

import UIKit

class ChatListCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var chatDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.profileImageView.layer.cornerRadius = 10
    }
    
    func configure(_ chat: ChatList) {
        self.profileImageView.image = UIImage(named: chat.imageName)
        self.userNameLabel.text = chat.name
        self.chatLabel.text = chat.chat
        self.chatDateLabel.text = formattedDateString(dateString: chat.date)
    }
    
    func formattedDateString(dateString: String) -> String {
     
        // String -> Date -> String
        
        // 2022 - 04 - 01 > 4 / 1
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        // 문자열 -> data 타입으로 변경
        if let date = formatter.date(from: dateString) {
           
            formatter.dateFormat = "M/d"
            return formatter.string(from: date)
            
        } else {
            
            return ""
        }
    }
}
