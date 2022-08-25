//
//  StockRankCollectionViewCell.swift
//  Homework2
//
//  Created by geonhui Yu on 2022/08/14.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var companyIconImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyPriceLabel: UILabel!
    @IBOutlet weak var diffLabel: UILabel!
    @IBOutlet weak var heartIconImageView: UIImageView!
    
    func configure(_ stock: StockModel) {
        rankLabel.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: stock.imageName)
        companyNameLabel.text = stock.name
//        companyPriceLabel.text = "\(convertToCurrencyFormat(price: stock.price)) 원"
        companyPriceLabel.text = "\(stock.price) 원"
        diffLabel.text = "\(stock.diff)%"
        diffLabel.textColor = stock.diff > 0 ? .systemRed : .systemBlue
    }
    
    func convertToCurrencyFormat(price: Int) -> String {
     
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        
        return result
    }
}
