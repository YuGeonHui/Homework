//
//  ChatListCollectionViewCell.swift
//  Homework2
//
//  Created by geonhui Yu on 2022/08/25.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.thumbnailImageView.layer.cornerRadius = thumbnailImageView.bounds.width / 2.0
    }
    
    func configure(_ chat: Chat) {
        
        thumbnailImageView.image = UIImage(named: chat.name)
        nameLabel.text = chat.name
        chatLabel.text = chat.chat
        dataLabel.text = chat.date
    }
}
