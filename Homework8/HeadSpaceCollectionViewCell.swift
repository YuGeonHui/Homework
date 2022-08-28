//
//  HeadSpaceCollectionViewCell.swift
//  Homework2
//
//  Created by geonhui Yu on 2022/08/28.
//

import UIKit

class HeadSpaceCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = UIColor.systemIndigo
        contentView.layer.cornerRadius = 10
    }
    
    func configure(_ item: Focus) {
        
        titleLabel.text = item.title
        descLabel.text = item.description
        thumbnailImageView.image = UIImage(systemName: item.imageName)?.withRenderingMode(.alwaysOriginal)
    }
}
