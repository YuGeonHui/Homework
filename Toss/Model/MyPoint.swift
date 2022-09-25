//
//  MyPoint.swift
//  UIKitStudy
//
//  Created by geonhui Yu on 2022/09/25.
//

import Foundation

struct MyPoint: Hashable {
    var point: Int
}

extension MyPoint {
    static let `defualt` = MyPoint(point: 0)
}
