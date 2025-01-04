import SwiftUI

@available(iOS 14.0, macOS 10.15, tvOS 13.0, *)
struct CardPopup: View {
    @Binding var isPresented: Bool
    @State private var offset: CGFloat = 0
    
    public init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    public var body: some View {
        GeometryReader { proxy in
            let screenHeight = proxy.frame(in: .global).height
            
            ZStack {
                LinearGradient(gradient: .init(colors: [.orange, .red]), startPoint: .top, endPoint: .bottom)
                
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
