//
//  BenefitListViewModel.swift
//  UIKitStudy
//
//  Created by geonhui Yu on 2022/09/25.
//

import Foundation
import Combine

final class BenefitListViewModel {
    
    @Published var todaySectionItem: [AnyHashable] = []
    @Published var otherSectionItem: [AnyHashable] = []
    
    let benefitDidTapped = PassthroughSubject<Benefit, Never>()
    let pointDidTapped = PassthroughSubject<MyPoint, Never>()
    
    func fetchItems() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.todaySectionItem = TodaySectionItem(point: .defualt, today: .today).sectionItems
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.otherSectionItem = Benefit.others
        }
    }
}
