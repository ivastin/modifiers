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
            .lineSpacing(2)
            .padding(.bottom, 16)
    }
}

extension View {
    func detailsTitle() -> some View {
        modifier(DetailsTitle())
    }
}

struct ErrorModifier: ViewModifier {
    let title: String
    let subtitle: String
    let enabled: Bool
    func body(content: Content) -> some View {
        if !enabled {
            content
        } else {
            ZStack(){
                content
                VStack() {
                    Text(title)
                        .font(.title)
                        .foregroundStyle(.red)
                        .padding(.bottom, 16)
                    Text(subtitle)
                        .font(.body)
                        .foregroundStyle(.black)
                }
                .padding(.vertical, 24)
                .padding(.horizontal, 24)
                .frame(width: 280)
                .background(Color.yellow)
                .cornerRadius(16)
            }
        }

    }
}

extension View {
    func showError(title: String = "Something went wrong", text: String?) -> some View {
        modifier(ErrorModifier(title: title, subtitle: text ?? "", enabled: text != nil))
    }
}


struct DetailsNavigation: ViewModifier {
    let title: String
    @Environment(\.dismiss) var dismiss
    func body(content: Content) -> some View {
        content
        .navigationBarTitle(title, displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    //Label("Back", systemImage: "arrow.left.circle")
                    Image(.back)
                        .frame(width: 24, height: 24)
                }
            }
        }
    }
}

extension View {
    func configureNavigation(title: String = "Task description") -> some View {
        modifier(DetailsNavigation(title: title))
    }
}
