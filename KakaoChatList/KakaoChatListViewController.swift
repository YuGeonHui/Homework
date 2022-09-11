//
//  KakaoChatListViewController.swift
//  UIKitStudy
//
//  Created by geonhui Yu on 2022/09/10.
//

import UIKit

class KakaoChatListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var list: [ChatList] = ChatList.list
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    
        list = list.sorted(by: { chat1, chat2 in
            return chat1.date < chat2.date
        })
    }
}

extension KakaoChatListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.bounds.width, height: 100)
    }
}

extension KakaoChatListViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.list.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatListCell", for: indexPath) as? ChatListCell else { return UICollectionViewCell() }
        
        let data = list[indexPath.item]
        cell.configure(data)
        
        return cell
    }
}
