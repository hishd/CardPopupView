//
//  ContentView.swift
//  CardPopupViewDemo
//
//  Created by Hishara Dilshan on 03/01/2025.
//

import SwiftUI
import CardPopupView

struct ContentView: View {
    @State var isCardPresented: Bool = false
    
    var body: some View {
        ZStack {
            Button("Toggle") {
                self.isCardPresented.toggle()
            }
        }
        .cardPopupView(
            isPresented: $isCardPresented,
            backgroundType: .gradient(
                LinearGradient(
                    gradient: .init(
                        colors: [.orange, .red]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        ) {
            EmptyView()
        }
    }
}

#Preview {
    ContentView()
}
