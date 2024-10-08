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
            ItemView(item: item)
            
            AsyncImage(url: URL(string: viewModel.content)) { image in
                image.resizable()
            } placeholder: {
                Color.red
            }
            .frame(width: 128, height: 128)
            .clipShape(.rect(cornerRadius: 25))
            
            Text("image:\(viewModel.content)")
                .padding()
               // .contentStyle()
            
        }
            .navigationBarTitle("Image for \(item.title)")
            .onAppear() {
                viewModel.loadData(itemId: item.id)
            }
    }
}

#Preview {
    ImageDetailsView(item: Item.sample)
}
