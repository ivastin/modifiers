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
            ItemView(item: item)
            Text(viewModel.content)
                .contentStyle()
        }
        .navigationBarTitle("Text for \(item.title)")
        .onAppear() {
            viewModel.loadData(itemId: item.id)
        }
    }
}

#Preview {
    TextDetailsView(item: Item.sample)
}
