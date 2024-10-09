//
//  Item.swift
//  Modifiers
//
//  Created by Mladen Ivastinovic on 15.09.2024..
//

import Foundation

struct Item: Codable, Identifiable, Hashable {
    let title: String
    let id: String
    let type: String
}

enum ItemType: String, Codable {
    case text
    case image
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
    let description: String
}


extension Item {
    static let sample = Item(title: "Sample item", id: "0", type: ItemType.text.rawValue)
}


// agenda
//1. native - example
//2. custom, modifiers struct + extension
//3. withArrow()
//4. details - Title
//5. scroll
//6. error?
