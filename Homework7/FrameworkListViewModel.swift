//
//  FrameworkListViewModel.swift
//  UIKitStudy
//
//  Created by geonhui Yu on 2022/10/02.
//

import Foundation
import Combine

final class FrameworkListViewModel {
    
    init(items: [AppleFramework], selectedItem: AppleFramework? = nil) {
        self.items = CurrentValueSubject(items)
        self.selectedItem = CurrentValueSubject(selectedItem)
    }
    
    // Data -> Output
    let items: CurrentValueSubject<[AppleFramework], Never>
    let selectedItem: CurrentValueSubject<AppleFramework?, Never>
    
    // User Action -> Input
    func didSelect(at indexPath: IndexPath) {
        
        let item = items.value[indexPath.item]
        selectedItem.send(item)
    }
}
