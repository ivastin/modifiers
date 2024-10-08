//
//  Modifiers.swift
//  Modifiers
//
//  Created by Mladen Ivastinovic on 15.09.2024..
//

import Foundation
import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ItemContent: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.red)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func contentStyle() -> some View {
        modifier(ItemContent())
    }
}
