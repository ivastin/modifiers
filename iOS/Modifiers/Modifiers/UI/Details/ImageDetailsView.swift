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
    @State private var animationAmount = 1.0
    var body: some View {
            VStack {
                Text(viewModel.title)
                    //.detailsTitle()
                    .fixedSize(horizontal: false, vertical: true)
                
                AsyncImage(url: URL(string: viewModel.content)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray.opacity(0.5)
                }
                .frame(width: 341, height: 185)
                .clipShape(.rect(cornerRadius: 25))
                //.scaleEffect(animationAmount)
                
                Text(viewModel.description)
                    .fixedSize(horizontal: false, vertical: true)
            }
            //.opacity(animationAmount)
            .animation(.easeInOut(duration: 2), value: animationAmount)
            .scrollableDetails()
//            .navigationBarTitle("Task description", displayMode: .inline)
            .configureNavigation()
            .onAppear() {
                animationAmount = 1.0
                viewModel.loadData(itemId: item.id)
            }
    }
}

#Preview {
    ImageDetailsView(item: Item.sample)
}
