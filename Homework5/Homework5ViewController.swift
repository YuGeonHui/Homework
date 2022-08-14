//
//  Homework5ViewController.swift
//  Homework2
//
//  Created by geonhui Yu on 2022/08/14.
//

import UIKit

class Homework5ViewController: UIViewController {
    
    let stockList: [StockModel] = StockModel.list

    @IBOutlet weak var collectionView: UICollectionView!
    
    // Data, Presentation, Layout
    // Data : 어떤 데이터를 쓸거야
    // Presentation : 셀을 어떻게 표현할꺼야?
    // Layout : 셀을 어떻게 배치할 거야 ??
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension Homework5ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.stockList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let stock = stockList[indexPath.item]
        cell.configure(stock)
        
        return cell
    }
}

extension Homework5ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // width == collectionView, height == 80
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}

// TODO: Bounds, CGPoint, CGFloat, CGSize, AutoLayout
// TODO: Casting, Guard
