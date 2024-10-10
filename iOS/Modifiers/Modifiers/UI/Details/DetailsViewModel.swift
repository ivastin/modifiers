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
    var title: String { details?.item.title ?? ""}
    var content: String {
        details?.content ?? ""
    }
    var description: String {
        details?.description ?? ""
    }
    var errorDescription: String?

    func loadData(itemId: String) {
        isLoading = true
        Task {
            do {
                print("will fetch details")
                try await details =  manager.fetchDetails(itemId: itemId)
                print("details fetced")
                isLoading = false
                haveData = true
                errorDescription = nil
                
            } catch {
                errorDescription = "Something is wrong..:\(error.localizedDescription)"
                isLoading = false
            }
        }

    }
}
