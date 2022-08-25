//
//  ChatModel.swift
//  Homework2
//
//  Created by geonhui Yu on 2022/08/25.
//

import Foundation



struct ChatModel {
    let name: String
    let chat: String
    let date: String
}

extension ChatModel {
    
    static let list: [ChatModel] = [
        ChatModel(name: "brain", chat: "안녕하세요", date: "2022-03-01"),
        ChatModel(name: "brain", chat: "안녕하세요", date: "2022-03-01"),
        ChatModel(name: "brain", chat: "안녕하세요", date: "2022-03-01"),
        ChatModel(name: "brain", chat: "안녕하세요", date: "2022-03-01"),
        ChatModel(name: "brain", chat: "안녕하세요", date: "2022-03-01"),
        ChatModel(name: "brain", chat: "안녕하세요", date: "2022-03-01"),
        ChatModel(name: "brain", chat: "안녕하세요", date: "2022-03-01"),
        ChatModel(name: "brain", chat: "안녕하세요", date: "2022-03-01"),
        ChatModel(name: "brain", chat: "안녕하세요", date: "2022-03-01")
    ]
}
