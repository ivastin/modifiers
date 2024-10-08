//
//  DetailsViewModel.swift
//  Modifiers
//
//  Created by Mladen Ivastinovic on 15.09.2024..
//

import Foundation

@Observable class DetailsViewModel {
    private let manager = NetworkManager()
    private var details: ItemDetails?
    var isLoading = false
    var haveData = false
    var content: String {
        details?.content ?? "loading"
    }
    var errorDescription: String?
    
    func loadData(itemId: String) {
        isLoading = true
        Task {
            do {
                try await details =  manager.fetchDetails(itemId: itemId)
                isLoading = false
                haveData = true
                errorDescription = nil
                
            } catch {
                errorDescription = "Something is wrong..:\(error.localizedDescription)"
                isLoading = false
            }
        }

    }
    
    func loadDetails(itemId: String) async throws {
        details = try await manager.fetchDetails(itemId: itemId)
    }
}
