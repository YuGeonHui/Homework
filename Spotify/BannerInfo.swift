//
//  BannerInfo.swift
//  UIKitStudy
//
//  Created by geonhui Yu on 2022/09/04.
//

import Foundation

struct BannerInfo: Hashable {
    
    let title: String
    let description: String
    let imageName: String
}

extension BannerInfo {
    
    static let list = [
        BannerInfo(title: "세계의 다양한\n음악을...", description: "다양한 장르의 해외 음악을 감상하세요.", imageName: "img_music_discover"),
        BannerInfo(title: "나만의 맞춤\n플레이리스트", description: "취향에 따라 나만의 리스트가 만들어져요.", imageName: "img_music_personalized"),
        BannerInfo(title: "오프라인으로\n음악을 들으세요", description: "앱에 곡을 다운로드하고 언제 어디서든 감상하세요.", imageName: "img_music_download"),
        BannerInfo(title: "어떤\n기기에서든지...", description: "모바일, PC, 테블릿에서 이용하실 수 있습니다.", imageName: "img_music_multi_device")
    ]
}
