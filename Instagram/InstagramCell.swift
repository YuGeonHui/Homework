//
//  InstagramCell.swift
//  UIKitStudy
//
//  Created by geonhui Yu on 2022/09/14.
//

import UIKit

class InstagramCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func prepareForReuse() {
        
        // 재사용되기 전에 준비한다.
        super.prepareForReuse()
        thumbnailImageView.image = nil
    }
    
    func configure(_ imageName: String) {
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
