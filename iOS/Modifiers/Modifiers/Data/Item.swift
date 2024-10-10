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
// TODO: agenda Android
//1. Modifiers general, fillWidth, background
//2. example padding, clip,
//3. order -> reusableDetailModifier
//4. best practice, chain, than
//5. scroll
//6. .clickable{ onItemClick(item) }

//8. fillWidthOfParent
//8. razočaranje, text => iOS

// TODO: agenda ios
//1. native - example
//2. custom, modifiers struct + extension
//.listRowSeparator(.hidden) ne radi na listi nego na itemu, borba sa padinzima, swiftui def
//3. withArrow(), plus na cijlu list
//4. details - Title na image?, reuse
//5. scroll
//6. navigacija
//6. error sa parametrima
//7. animacije na image details
