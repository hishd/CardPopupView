//
//  File.swift
//  CardPopupView
//
//  Created by Hishara Dilshan on 04/01/2025.
//

import Foundation
import SwiftUI

@available(iOS 14.0, macOS 10.15, tvOS 13.0, *)
fileprivate struct CardPopupViewModifier: ViewModifier {
    var isPresented: Binding<Bool>
    
    func body(content: Content) -> some View {
        ZStack {
            content
            CardPopup(isPresented: isPresented)
        }
    }
}

@available(iOS 14.0, macOS 10.15, tvOS 13.0, *)
public extension View {
    func cardPopupView(isPresented: Binding<Bool>) -> some View {
        modifier(CardPopupViewModifier(isPresented: isPresented))
    }
}
