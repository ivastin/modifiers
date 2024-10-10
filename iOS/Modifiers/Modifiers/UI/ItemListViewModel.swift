//
//  ItemListViewModel.swift
//  Modifiers
//
//  Created by Mladen Ivastinovic on 15.09.2024..
//

import Foundation

import Foundation

extension ItemListView {
    @Observable class ViewModel {
        var errorDescription: String?
        var isLoading = false
        var items = [Item]()
        private let manager = NetworkManager()
        func loadItems() async throws {
            do {
                self.items = try await manager.fetchItems()
            } catch {
                errorDescription = "Something is wrong..:\(error.localizedDescription)"
                print("error description = \(errorDescription)")
                isLoading = false
            }
        }
    }
}
