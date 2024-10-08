//
//  Item.swift
//  Modifiers
//
//  Created by Mladen Ivastinovic on 15.09.2024..
//

import Foundation

struct Item: Codable, Identifiable, Hashable {
    let title: String
    let description: String
    let id: String
    let type: String
}

enum ItemType: String, Codable {
    case text
    case image
    case url
    case unknown
}

extension Item {
    var itemType: ItemType {
        ItemType(rawValue: type) ?? .unknown
    }
}

struct ItemDetails: Codable {
    let item: Item
    let content: String
    let loadingTime: Int = 0
}


extension Item {
    static let sample = Item(title: "Sample item", description: "description for sample item", id: "0", type: ItemType.text.rawValue)
}
