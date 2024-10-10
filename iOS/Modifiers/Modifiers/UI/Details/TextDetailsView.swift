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
    @Environment(\.dismiss) var dismiss
    var body: some View {
            VStack {
                Text(viewModel.title)
                    .detailsTitle()
                Text(viewModel.content)
                Text(viewModel.description)
            }
            .scrollableDetails()
            //.showError(text: viewModel.errorDescription)
            .navigationBarTitle("Task description", displayMode: .inline)
//            .navigationBarBackButtonHidden(true)
//            .toolbar {
//                ToolbarItem(placement: .topBarLeading) {
//                    Button(action: {
//                        dismiss()
//                    }) {
//                        Label("Back", systemImage: "arrow.left.circle")
//                    }
//                }
//            }
        .onAppear() {
            viewModel.loadData(itemId: item.id)
        }
    }
}

#Preview {
    TextDetailsView(item: Item.sample)
}
