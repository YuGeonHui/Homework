//
//  ItemInfo.swift
//  UIKitStudy
//
//  Created by geonhui Yu on 2022/10/06.
//

import Foundation

struct ItemInfo: Codable, Hashable {
    
    let postID: String
    let title: String
    let location: String
    let updated: TimeInterval
    let price: Int
    let numOfChats: Int
    let numOfLikes: Int
    let thumbnailURL: String
}
