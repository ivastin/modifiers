//
//  NetworkManager.swift
//  Modifiers
//
//  Created by Mladen Ivastinovic on 15.09.2024..
//

import Foundation

import Foundation

enum NetworkError: Error {
    case general
}

class NetworkManager {
    let baseUrl = "http://192.168.2.191:8080"
    func fetchItems() async throws -> [Item] {
        guard let url = URL(string: baseUrl + "/items") else {
            throw(NetworkError.general)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let items = try JSONDecoder().decode([Item].self, from: data)
        return items
    }
    
    func fetchDetails(itemId: String) async throws -> ItemDetails {
        guard let url = URL(string: baseUrl + "/details/\(itemId)/") else {
            throw(NetworkError.general)
        }
        print("loading from \(url.absoluteString)")
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let code = (response as? HTTPURLResponse)?.statusCode else {
            throw(NetworkError.general)
        }
        print("status: \(code)")
        guard code >= 200 && code < 300 else {
            throw(NetworkError.general)
        }
        
        print("data \(data)")
        let item = try JSONDecoder().decode(ItemDetails.self, from: data)
        print("item \(item)")
        return item
    }
}
