//
//  SpotifyViewCoViewController.swift
//  UIKitStudy
//
//  Created by geonhui Yu on 2022/09/02.
//

import UIKit

class SpotifyViewCoViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var freeUseButton: UIButton!
    
    let bannerInfos: [BannerInfo] = BannerInfo.list
    let colors: [UIColor] = [.systemIndigo, .systemOrange, .systemPink, .systemRed]
    
    enum Section {
        case main
    }
    
    typealias Item = BannerInfo
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        freeUseButton.layer.cornerRadius = 25
        pageControl.numberOfPages = bannerInfos.count

        // presentation: diffable dataSource
        self.updatePresent()
        
        // data: snapshot
        self.updateSnapshot()
        
        // layout: compositional Layout
        collectionView.collectionViewLayout = updateLayout()
        collectionView.alwaysBounceVertical = false
    }
}

// MARK: - Setting DataSoruce
extension SpotifyViewCoViewController {
    
    private func updatePresent() {
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCell else {
                return nil
            }
            
            cell.configure(itemIdentifier)
            cell.backgroundColor = self.colors[indexPath.row]
            return cell
        })
    }
    
    private func updateSnapshot() {
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(bannerInfos, toSection: .main)
        
        dataSource.apply(snapshot)
    }
    
    private func updateLayout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 20
        
        // Pagable Process
        section.visibleItemsInvalidationHandler = { item, offset, event in
            let index = Int((offset.x / event.container.contentSize.width).rounded(.up))
            self.pageControl.currentPage = index
        }
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

