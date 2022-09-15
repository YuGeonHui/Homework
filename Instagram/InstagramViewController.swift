//
//  InstagramViewController.swift
//  UIKitStudy
//
//  Created by geonhui Yu on 2022/09/14.
//

import UIKit

class InstagramViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        if let flowLayot = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayot.estimatedItemSize = .zero
        }
        
        self.navigationItem.title = "Search"
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Seach"
        searchController.searchResultsUpdater = self
        
        self.navigationItem.searchController = searchController
    }
}

extension InstagramViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let interItemSpacing: CGFloat = 1
        let width = (collectionView.bounds.width - interItemSpacing * 2) / 3
        let height = width
        
        return CGSize(width: width, height: height)
    }
}

extension InstagramViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InstagramCell", for: indexPath) as? InstagramCell else {
            return UICollectionViewCell()
        }
        
        let imageName = "animal\(indexPath.item + 1)"
        cell.configure(imageName)
        
        return cell
    }
}

extension InstagramViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let searh = searchController.searchBar.text
        print("search: \(searh)")
    }
}
