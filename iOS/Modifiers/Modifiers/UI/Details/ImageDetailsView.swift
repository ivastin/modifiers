//
//  ImageDetailsView.swift
//  Modifiers
//
//  Created by Mladen Ivastinovic on 15.09.2024..
//

import SwiftUI

struct ImageDetailsView: View {
    let item: Item
    let viewModel = DetailsViewModel()
    var body: some View {
            VStack {
                Text(viewModel.title)
                    .detailsTitle()
                    .fixedSize(horizontal: false, vertical: true)
                
                AsyncImage(url: URL(string: viewModel.content)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray.opacity(0.5)
                }
                .frame(width: 341, height: 185)
                .clipShape(.rect(cornerRadius: 25))
                
                Text(viewModel.description)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .scrollableDetails()
 
            .navigationBarTitle("Task description")
            .onAppear() {
                viewModel.loadData(itemId: item.id)
            }
    }
}

#Preview {
    ImageDetailsView(item: Item.sample)
}
