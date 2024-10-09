//
//  TextDetailsView.swift
//  Modifiers
//
//  Created by Mladen Ivastinovic on 15.09.2024..
//

import SwiftUI

struct TextDetailsView: View {
    let item: Item
    let viewModel = DetailsViewModel()
    var body: some View {
            VStack {
                Text(viewModel.title)
                    .detailsTitle()
                Text(viewModel.content)
                Text(viewModel.description)
            }
            .scrollableDetails()
        .navigationBarTitle("Task description")
        .onAppear() {
            viewModel.loadData(itemId: item.id)
        }
    }
}

#Preview {
    TextDetailsView(item: Item.sample)
}
