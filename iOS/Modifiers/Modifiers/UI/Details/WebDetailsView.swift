//
//  WebDetailsView.swift
//  Modifiers
//
//  Created by Mladen Ivastinovic on 15.09.2024..
//

import SwiftUI

struct WebDetailsView: View {
    let item: Item
    let viewModel = DetailsViewModel()
    var body: some View {
        VStack {
            ItemView(item: item)
            Text("url:\(viewModel.content)")
                .contentStyle()
        }
        .navigationBarTitle("Web for \(item.title)")
        .onAppear() {
            viewModel.loadData(itemId: item.id)
        }
    }
}

#Preview {
    WebDetailsView(item: Item.sample)
}
