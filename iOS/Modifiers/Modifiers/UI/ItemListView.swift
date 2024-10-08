//
//  ItemListView.swift
//  Modifiers
//
//  Created by Mladen Ivastinovic on 15.09.2024..
//

import SwiftUI

struct ItemListView: View {
    @State private var viewModel = ViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.items) { item in
                    NavigationLink(item.title, value: item)
                        .titleStyle()
                }
            }
            .navigationDestination(for: Item.self) { item in
                switch item.itemType {
                case .text:
                    TextDetailsView(item: item)
                case .image:
                    ImageDetailsView(item: item)
                case .url:
                    WebDetailsView(item: item)
                case .unknown:
                    DetailView(item: item)
                }
            }
            .navigationBarTitle("List of Items")
        }
        .task {
            try? await viewModel.loadItems()
        }
    }
}

#Preview {
    ItemListView()
}
