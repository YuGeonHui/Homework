//
//  ChatList.swift
//  UIKitStudy
//
//  Created by geonhui Yu on 2022/09/10.
//

import Foundation

struct ChatList {
    let imageName: String
    let name: String
    let chat: String
    let date: String
}

extension ChatList {
    
    static let list: [ChatList] = [
        ChatList(imageName: "default", name: "건희", chat: "날짜의 포멧형태가 date의 값이랑 다른데 이걸 어떻게 하면 바꿀 수 있을까", date: "2022-09-09"),
        ChatList(imageName: "default", name: "건희", chat: "안녕하세요", date: "2022-09-09"),
        ChatList(imageName: "default", name: "건희", chat: "안녕하세요", date: "2022-09-09"),
        ChatList(imageName: "default", name: "건희", chat: "안녕하세요", date: "2022-09-09"),
        ChatList(imageName: "default", name: "건희", chat: "한 줄이 길어지면 옆에 날짜랑 간격이 붙여질거 같은데 어떻게 할지 생각을 해봐야겠다.", date: "2022-09-10"),
        ChatList(imageName: "default", name: "건희", chat: "안녕하세요", date: "2022-09-10"),
        ChatList(imageName: "default", name: "건희", chat: "안녕하세요", date: "2022-09-11"),
        ChatList(imageName: "default", name: "건희", chat: "안녕하세요", date: "2022-09-12"),
        ChatList(imageName: "default", name: "건희", chat: "안녕하세요", date: "2022-09-12"),
        ChatList(imageName: "default", name: "건희", chat: "안녕하세요", date: "2022-09-12"),
        ChatList(imageName: "default", name: "건희", chat: "안녕하세요", date: "2022-09-12"),
        ChatList(imageName: "default", name: "건희", chat: "날짜 순서가 거꾸로 되어있는데, 이거 반대로 출력해야 할거 같은데 이럴때는 어떻게 해야될까??", date: "2022-09-12")
    ]
}
