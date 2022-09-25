//
//  MyPointCell.swift
//  UIKitStudy
//
//  Created by geonhui Yu on 2022/09/25.
//

import UIKit

class MyPointCell: UICollectionViewCell {
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
    func configure(item: MyPoint) {
     
        iconView.image = UIImage(named: "ic_point")
        descriptionLabel.text = "내 포인트"
        pointLabel.text = "\(item.point) 원"
    }
}
