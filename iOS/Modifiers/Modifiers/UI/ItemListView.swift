//
//  ItemListView.swift
//  Modifiers
//
//  Created by Mladen Ivastinovic on 15.09.2024..
//

import SwiftUI

struct ItemListView: View {
    @State private var viewModel = ViewModel()
    @State private var navPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navPath) {
            List {
                ForEach(viewModel.items) { item in
                    Button(item.title) {
                        navPath.append(item)
                    }
                    .buttonAdjustments()
                    .withArrow()
                }
                .listRowAdjustments()
            }
            .listAdjustments()
            
            .navigationDestination(for: Item.self) { item in
                switch item.itemType {
                case .text:
                    TextDetailsView(item: item)
                case .image:
                    ImageDetailsView(item: item)
                case .unknown:
                    DetailView(item: item)
                }
            }
            .navigationBarTitle("Tasks")
        }
        .task {
            try? await viewModel.loadItems()
        }
    }
}

#Preview {
    ItemListView()
}
