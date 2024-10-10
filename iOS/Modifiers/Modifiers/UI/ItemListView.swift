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
                    //.buttonStyle(.plain)
                    //.font(.system(size: 16))
                    //.lineSpacing(6)
                    //.withArrow()
                }
                //.listStyle(.plain)
                //.listRowSeparator(.hidden)
                //.padding(0)
                //.listRowBackground(Color.clear)
                //.listRowInsets(.init())
            }
            //.listStyle(.plain)
            //.listRowSpacing(8.0)
            //.padding(.top, 20)
            //.padding(.horizontal, 16)
            //.background(Color.gray.opacity(0.1))
            
            .navigationDestination(for: Item.self) { item in
                switch item.itemType {
                case .text:
                    TextDetailsView(item: item)
                case .image:
                    ImageDetailsView(item: item)
                case .unknown:
                    TextDetailsView(item: item)
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
