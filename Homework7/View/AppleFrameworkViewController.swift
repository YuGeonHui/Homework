//
//  AppleFrameworkViewController.swift
//  Homework2
//
//  Created by geonhui Yu on 2022/08/27.
//

import Foundation
import UIKit
import Combine

class AppleFrameworkViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var subscriptions = Set<AnyCancellable>()
    var viewModel: FrameworkListViewModel!
    var dataSorce: UICollectionViewDiffableDataSource<Section, Item>!
    
    typealias Item = AppleFramework
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = FrameworkListViewModel(items: AppleFramework.list)
        configureCollectionView()
        bind()
        
        collectionView.collectionViewLayout = layout()
        collectionView.delegate = self
    }
    
    private func bind() {
        
        viewModel.items
            .receive(on: RunLoop.main)
            .sink { [unowned self] list in
                self.applySessionItems(list)
            }.store(in: &subscriptions)
        
        viewModel.selectedItem
            .compactMap { $0 }
            .receive(on: RunLoop.main)
            .sink { framework in
                
                let sb = UIStoryboard(name: "Detail", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "FramewrokDetailViewController") as! FramewrokDetailViewController
                vc.framework.send(framework)
                self.present(vc, animated: true)
            }.store(in: &subscriptions)
    }
    
    private func applySessionItems(_ items: [Item], to section: Section = .main) {
        
        var snapShot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapShot.appendSections([section])
        snapShot.appendItems(items, toSection: section)
        dataSorce.apply(snapShot)
    }
    
    private func configureCollectionView()  {
        
        dataSorce = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppleFrameworkCell", for: indexPath) as? AppleFrameworkCell else {
                return nil
            }
            
            cell.configure(item)
            return cell
        })
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

extension AppleFrameworkViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        viewModel.didSelect(at: indexPath)
    }
}
