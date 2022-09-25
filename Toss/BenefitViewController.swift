//
//  BenefitViewController.swift
//  UIKitStudy
//
//  Created by geonhui Yu on 2022/09/25.
//

import UIKit

class BenefitViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    typealias Item = AnyHashable
    
    enum Section: Int {
        case today
        case other
    }
    
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
    var todaySectionItem: [AnyHashable] = TodaySectionItem(point: .defualt, today: .today).sectionItems
    var otherSectionItem: [AnyHashable] = [Benefit.others]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            
            guard let section = Section(rawValue: indexPath.section) else { return nil }

            let cell = self.configureCell(for: section, item: item, collectionView: collectionView, indexPath: indexPath)

            return cell
        })
        
        var snapShot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapShot.appendSections([.today, .other])
        snapShot.appendItems(todaySectionItem, toSection: .today)
        snapShot.appendItems(otherSectionItem, toSection: .other)
        datasource.apply(snapShot)
        
        // collectionView.collectionViewLayout = layout()
        
        navigationItem.title = "혜택"

    }

    
    private func configureCell(for section: Section, item: Item, collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell? {
        
        switch section {
        case .today:
            
            if let point = item as? MyPoint {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPointCell", for: indexPath) as! MyPointCell
                cell.configure(item: point)
                
                return cell
                
            } else if let benefit = item as? Benefit {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodayBenefitCell", for: indexPath) as! TodayBenefitCell
                cell.configure(item: benefit)
                
                return cell
                
                
            } else {
                return nil
            }
            
        case .other:
            
            if let benefit = item as? Benefit {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BenefitCell", for: indexPath) as! BenefitCell
                cell.configure(item: benefit)
                
                return cell
                
            } else {
                return nil
            }
        }
    }
    
//    private func layout() -> UICollectionViewCompositionalLayout {
//
//    }
}
