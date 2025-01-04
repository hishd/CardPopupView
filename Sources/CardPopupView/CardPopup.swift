import SwiftUI

@available(iOS 14.0, macOS 10.15, tvOS 13.0, *)
struct CardPopup<CardContent: View>: View {
    @Binding var isPresented: Bool
    @State private var offset: CGFloat = 0
    
    let cardBackgroundType: CardBackground
    var content: () -> CardContent
    
    public var body: some View {
        GeometryReader { proxy in
            let screenHeight = proxy.frame(in: .global).height
            
            ZStack {
                cardBackground
                
                VStack {
                    HStack {
                        Button {
                            self.isPresented.toggle()
                        } label: {
                            Image(systemName: "xmark.circle").font(.title)
                        }.foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
                }
                .frame(maxHeight: .infinity, alignment: .topLeading)
                
                content().padding(.top, 40)
            }
            .cornerRadius(25)
            .padding()
            .offset(y: self.offset)
            .rotation3DEffect(.init(degrees: self.isPresented ? 0 : 55), axis: (x: self.isPresented ? 0 : 1.0, y: 0, z: 0))
            .opacity(isPresented ? 1.0 : 0)
            .onAppear {
                self.offset = -screenHeight
            }
            .onChange(of: isPresented, perform: { newValue in
                self.offset = self.isPresented ? 0 : -screenHeight
            })
            .animation(.easeInOut(duration: 0.5))
        }
    }
}

@available(iOS 14.0, macOS 10.15, tvOS 13.0, *)
extension CardPopup {
    
    @ViewBuilder
    var cardBackground: some View {
        switch cardBackgroundType {
        case .solid(let color):
            color
        case .gradient(let gradient):
            gradient
        }
    }
}

public enum CardBackground {
    case solid(Color)
    case gradient(LinearGradient)
}

//@available(iOS 14.0, macOS 10.15, tvOS 13.0, *)
//extension CardPopup where CardContent == EmptyView {
//    init(isPresented: Binding<Bool>) {
//        self.init(isPresented: isPresented) {
//            EmptyView()
//        }
//    }
//}
