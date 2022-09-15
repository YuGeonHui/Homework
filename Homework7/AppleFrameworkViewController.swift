//
//  AppleFrameworkViewController.swift
//  Homework2
//
//  Created by geonhui Yu on 2022/08/27.
//

import Foundation
import UIKit

class AppleFrameworkViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [AppleFramework] = AppleFramework.list
    
    var dataSorce: UICollectionViewDiffableDataSource<Section, Item>!
    
    typealias Item = AppleFramework
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // collectionView.delegate = self
        
        dataSorce = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
        
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppleFrameworkCell", for: indexPath) as? AppleFrameworkCell else {
                return nil
            }
            
            cell.configure(item)
            return cell
        })
        
        var snapShot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapShot.appendSections([.main])
        snapShot.appendItems(list, toSection: .main)
        dataSorce.apply(snapShot)
        
        collectionView.collectionViewLayout = layout()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1)) // group의 가로 1/3, group의 높이랑 같은 높이를 사용하겠다.
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5)) // Section의 너비를 그대로사용, Section의 1/3 => 높이
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 0, trailing: 12)
        
        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }
}


