//
//  TodaySectionItem.swift
//  UIKitStudy
//
//  Created by geonhui Yu on 2022/09/25.
//

import Foundation

struct TodaySectionItem {
    
    var point: MyPoint
    var today: Benefit
    
    var sectionItems: [AnyHashable] {
        return [point, today]
    }
}

extension TodaySectionItem {
    static let mock = TodaySectionItem(point: MyPoint(point: 0), today: Benefit.walk)
}
