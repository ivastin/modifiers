//
//  ItemView.swift
//  Modifiers
//
//  Created by Mladen Ivastinovic on 15.09.2024..
//

import Foundation
import SwiftUI

struct ItemView: View {
    let item: Item
    
    var body: some View {
        VStack {
            Text(item.title)
                .titleStyle()
//            Text(item.description)
//                .padding()
//            Text(item.id)
//                .padding()
//            Text(item.type)
//                .padding()
        }
    }
}

#Preview {
    ItemView(item: Item.sample)
}
