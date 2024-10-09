//
//  Modifiers.swift
//  Modifiers
//
//  Created by Mladen Ivastinovic on 15.09.2024..
//

import Foundation
import SwiftUI


struct WithArrow: ViewModifier {
    func body(content: Content) -> some View {
        HStack(spacing: 0){
            content
                .frame(maxWidth: .infinity, alignment: .leading)
            Image(.arrow)
                .frame(width: 24, alignment: .trailing)
        }
        .padding()
        .background(.white)
        .cornerRadius(16)
    }
}


extension View {
    func withArrow() -> some View {
        modifier(WithArrow())
    }
}

struct ListRowAdjustments: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowSeparator(.hidden)
            .padding(0)
            .listRowBackground(Color.clear)
            .listRowInsets(.init()) // //.listRowInsets(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/) - not same
            
    }
}

extension View {
    func listRowAdjustments() -> some View {
        modifier(ListRowAdjustments())
    }
}

struct ListAdjustments: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listStyle(.plain)
            .listRowSpacing(8.0)
            .padding(.top, 20)
            .padding(.horizontal, 16)
            .background(Color.gray.opacity(0.1))
    }
}

extension View {
    func listAdjustments() -> some View {
        modifier(ListAdjustments())
    }
}

struct ButtonAdjustments: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.plain)
            .font(.system(size: 16))
            .lineSpacing(6)
    }
}

extension View {
    func buttonAdjustments() -> some View {
        modifier(ButtonAdjustments())
    }
}


struct ScrollableDetails: ViewModifier {
    func body(content: Content) -> some View {
        ScrollView {
            content
        }
        .padding(16)
    }
}


extension View {
    func scrollableDetails() -> some View {
        modifier(ScrollableDetails())
    }
}


struct DetailsTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24, weight: .bold))
            .lineSpacing(6)
    }
}

extension View {
    func detailsTitle() -> some View {
        modifier(ButtonAdjustments())
    }
}
