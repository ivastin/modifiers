//
//  ItemListViewModel.swift
//  Modifiers
//
//  Created by Mladen Ivastinovic on 15.09.2024..
//

import Foundation

extension ItemListView {
    @Observable class ViewModel {
        var items = [Item]()
        private let manager = NetworkManager()
        func loadItems() async throws {
            let items = try await manager.fetchItems()
            self.items = items
        }
    }
}
