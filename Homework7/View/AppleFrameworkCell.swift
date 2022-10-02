//
//  AppleFrameworkCell.swift
//  Homework2
//
//  Created by geonhui Yu on 2022/08/27.
//

import UIKit

class AppleFrameworkCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.numberOfLines = 1
        nameLabel.adjustsFontSizeToFitWidth = true // font 사이즈 조정
    }
    
    func configure(_ framework: AppleFramework) {
        thumbnailImageView.image = UIImage(named: framework.imageName)
        nameLabel.text = framework.name
    }
}
