//
//  BannerCell.swift
//  UIKitStudy
//
//  Created by geonhui Yu on 2022/09/04.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 20
    }
    
    func configure(_ bannerInfo: BannerInfo) {
        titleLabel.text = bannerInfo.title
        descLabel.text = bannerInfo.description
        thumbnailImageView.image = UIImage(named: bannerInfo.imageName)
    }
}
