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
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.isCardPresented.toggle()
//                    self.offset = self.isPresented ? 0 : -screenHeight
                }
            }
            
            CardPopupView(isPresented: $isCardPresented)
        }
    }
}

#Preview {
    ContentView()
}
