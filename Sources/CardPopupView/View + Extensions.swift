//
//  File.swift
//  CardPopupView
//
//  Created by Hishara Dilshan on 04/01/2025.
//

import Foundation
import SwiftUI

@available(iOS 14.0, macOS 10.15, tvOS 13.0, *)
public extension View {
    func cardPopupView(isPresented: Binding<Bool>, content:  @escaping () -> some View) -> some View {
        ZStack {
            self
            CardPopup(isPresented: isPresented, content: content)
        }
    }
}
