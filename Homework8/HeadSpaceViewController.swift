//
//  HeadSpaceViewController.swift
//  Homework2
//
//  Created by geonhui Yu on 2022/08/28.
//

import UIKit

class HeadSpaceViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [Focus] = Focus.list
    enum Section {
        case main
    }
    typealias Item = Focus

    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // presentation
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeadSpaceCollectionViewCell", for: indexPath) as? HeadSpaceCollectionViewCell else { return nil }
            
            let data = self.items[indexPath.row]
            cell.configure(data)
            
//            cell.configure(item)
            return cell
        })
        
        // data
        var snapShot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapShot.appendSections([.main])
        snapShot.appendItems(items, toSection: .main)
        dataSource.apply(snapShot)
        
        // layout
        collectionView.collectionViewLayout = layout()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        section.interGroupSpacing = 10
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
