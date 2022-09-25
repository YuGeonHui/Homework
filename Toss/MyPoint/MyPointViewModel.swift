//
//  MyPointViewModel.swift
//  UIKitStudy
//
//  Created by geonhui Yu on 2022/09/25.
//

import Foundation
import Combine

final class MyPointViewModel {
    
    @Published var point: MyPoint = .defualt
    
    init(point: MyPoint) {
        self.point = point
    }
}
