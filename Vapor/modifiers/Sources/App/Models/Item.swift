//
//  File.swift
//  
//
//  Created by Mladen Ivastinovic on 15.09.2024..
//

import Foundation
import Vapor

struct Item: Content {
    let title: String
    let id: String
    let type: String
}

enum ItemType: String, Codable {
    case text
    case image
}


extension Item {
    static let sample = [Item(title: "Refactor main components to match the system", id: "1", type: ItemType.text.rawValue),
                         Item(title: "Add profile details to online forms", id: "2", type: ItemType.text.rawValue),
                         Item(title: "Debug and fix reported issues (QA process)", id: "3", type: ItemType.image.rawValue),
                         Item(title: "Integrate user experience (UX) improvements0", id: "4", type: ItemType.image.rawValue),
                         Item(title: "Upload documents to internal records", id: "5", type: ItemType.text.rawValue),
                         Item(title: "Connect front-end with back-end (API integration)", id: "6", type: ItemType.text.rawValue),
                         Item(title: "Review with the client", id: "7", type: ItemType.text.rawValue),
                         Item(title: "Implement responsive design (mobile & desktop compatibility)", id: "8", type: ItemType.text.rawValue),
                         Item(title: "Conduct end-to-end testing", id: "9", type: ItemType.text.rawValue)]
    
    static func createDetails(itemId: String) -> ItemDetails? {
        guard let item = sample.filter({ $0.id == itemId }).first else { return nil }
        if let index = Int(itemId), index == sample.count {
            return nil
        }
        switch item.id {
        case "1":
            return ItemDetails(item: item, content: Item.defContentString, description: Item.defContentString)
        case "2":
            return ItemDetails(item: item, content: Item.defContentString, description: Item.defContentString)
        case "3":
            return ItemDetails(item: item, content: Item.defImage, description: Item.defContentString)
        case "4":
            return ItemDetails(item: item, content: Item.defImage, description: Item.defContentString)
        case "5":
            return ItemDetails(item: item, content: Item.defContentString, description: "description")
        case "6":
            return ItemDetails(item: item, content: Item.defContentString, description: "description")
        case "7":
            return ItemDetails(item: item, content: Item.defContentString, description: "description")
        case "8":
            return ItemDetails(item: item, content: Item.defContentString, description: "description")
        case "9":
            return ItemDetails(item: item, content: Item.defContentString)
        default:
            return nil
        }
    }
}

struct ItemDetails: Content {
    let item: Item
    let content: String?
    let description: String?
    
}

extension ItemDetails {
    init(item: Item, content: String?) {
        self.item = item
        self.content = content
        self.description = nil
    }
}


extension Item {
    static let defContentString =
    """
    In this task, the front-end and back-end layers of the app are seamlessly connected through API integration. The goal is to enable data exchange between the client-side interface (front-end) and the server-side logic (back-end). This process involves consuming the back-end API endpoints from the front-end, ensuring that user inputs, interactions, and requests are sent to the server, processed, and returned with the appropriate response (e.g., data, success/failure messages).

    The task typically includes:
    API Request Handling: Setting up HTTP methods (GET, POST, PUT, DELETE) to communicate with the back-end API.
    Data Flow Management: Sending user input or form data from the front-end to the back-end, and displaying the returned data or results on the UI.
    Error Handling: Implementing error-handling mechanisms for failed API requests (e.g., incorrect data input, network issues).
    Authentication & Security: Ensuring secure data transmission by integrating tokens (e.g., JWT) or session management for authenticated users.
    State Management: Managing the application's state (using frameworks like Redux, Vuex, or React's context API) to reflect real-time changes when interacting with the back-end.
    Testing & Debugging: Testing API requests and responses to ensure proper data flow and resolving issues such as incorrect responses or latency.
    """
    static let defImage = "https://www.computerhope.com/jargon/p/program.png"
    static let description =
    """
    In this task, the front-end and back-end layers of the app are seamlessly connected through API integration. The goal is to enable data exchange between the client-side interface (front-end) and the server-side logic (back-end). This process involves consuming the back-end API endpoints from the front-end, ensuring that user inputs, interactions, and requests are sent to the server, processed, and returned with the appropriate response (e.g., data, success/failure messages).

    The task typically includes:
    API Request Handling: Setting up HTTP methods (GET, POST, PUT, DELETE) to communicate with the back-end API.
    Data Flow Management: Sending user input or form data from the front-end to the back-end, and displaying the returned data or results on the UI.
    Error Handling: Implementing error-handling mechanisms for failed API requests (e.g., incorrect data input, network issues).
    Authentication & Security: Ensuring secure data transmission by integrating tokens (e.g., JWT) or session management for authenticated users.
    State Management: Managing the application's state (using frameworks like Redux, Vuex, or React's context API) to reflect real-time changes when interacting with the back-end.
    Testing & Debugging: Testing API requests and responses to ensure proper data flow and resolving issues such as incorrect responses or latency.
    """
}
