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
    
    func configure(_ framework: AppleFramework) {
        thumbnailImageView.image = UIImage(named: framework.imageName)
        nameLabel.text = framework.name
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
}
