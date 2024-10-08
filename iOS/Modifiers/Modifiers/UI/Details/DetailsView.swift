//
//  DetailsView.swift
//  Modifiers
//
//  Created by Mladen Ivastinovic on 15.09.2024..
//

import Foundation
import SwiftUI

struct DetailView: View {
    let item: Item

    var body: some View {
        VStack {
            ItemView(item: item)
        }
        .navigationBarTitle(item.title)
    }
}

#Preview {
    DetailView(item: Item.sample)
}
