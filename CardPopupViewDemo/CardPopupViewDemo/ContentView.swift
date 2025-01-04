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
    @State var backgroundGradient: LinearGradient = .init(colors: [.black, .white], startPoint: .top, endPoint: .bottom)
    @State var selectedPlanet: PlanetData?
    
    var body: some View {
        NavigationStack {
            ZStack {
                List(self.data) { item in
                    HStack {
                        Text(item.planetName)
                        Spacer()
                        Button("View") {
                            self.backgroundGradient = LinearGradient(
                                gradient: .init(
                                    colors: [item.planetColor1, item.planetColor2]
                                ),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            self.selectedPlanet = item
                            self.isCardPresented.toggle()
                        }
                    }
                }
            }
            .navigationTitle("Planet Facts")
            .cardPopupView(
                isPresented: $isCardPresented,
                backgroundType: .gradient(
                    backgroundGradient
                )
            ) {
                PlanetInfoView(data: selectedPlanet ?? data.first!, isCardPresented: self.$isCardPresented)
            }
        }
    }
}

extension ContentView {
    var data: [PlanetData] {
        [
            .init(
                planetName: "Mercury",
                planetImageUrl: Bundle.main.url(forResource: "mercury", withExtension: "png"),
                planetInformation: "Mercury is the closest planet to the Sun and due to its proximity it is not easily seen except during twilight. For every two orbits of the Sun, Mercury completes three rotations about its axis and up until 1965 it was thought that the same side of Mercury constantly faced the Sun. Thirteen times a century Mercury can be observed from the Earth passing across the face of the Sun in an event called a, transit, the next will occur on the 9th May 2016.",
                planetColor1: .gray,
                planetColor2: .black
            ),
            .init(
                planetName: "Venus",
                planetImageUrl: Bundle.main.url(forResource: "venus", withExtension: "png"),
                planetInformation: "Venus is the second planet from the Sun and is the second largest terrestrial planet. Venus is sometimes referred to as the Earth’s sister planet due to their similar size and mass. Venus is named after the Roman goddess of love and beauty.",
                planetColor1: .gray,
                planetColor2: .yellow
            ),
            .init(
                planetName: "Earth",
                planetImageUrl: Bundle.main.url(forResource: "earth", withExtension: "png"),
                planetInformation: "Earth is the third planet from the Sun and is the largest of the terrestrial planets. The Earth is the only planet in our solar system not to be named after a Greek or Roman deity. The Earth was formed approximately 4.54 billion years ago and is the only known planet to support life.",
                planetColor1: .green,
                planetColor2: .blue
            ),
            .init(
                planetName: "Mars",
                planetImageUrl: Bundle.main.url(forResource: "mars", withExtension: "png"),
                planetInformation: "Mars is the fourth planet from the Sun and is the second smallest planet in the solar system. Named after the Roman god of war, Mars is also often described as the “Red Planet” due to its reddish appearance. Mars is a terrestrial planet with a thin atmosphere composed primarily of carbon dioxide.",
                planetColor1: .red,
                planetColor2: .orange
            ),
            .init(
                planetName: "Jupiter",
                planetImageUrl: Bundle.main.url(forResource: "jupiter", withExtension: "png"),
                planetInformation: "Jupiter is the largest planet in the solar system and is the fifth planet out from the Sun. It is two and a half times more massive than all the other planets in the solar system combined. It is made primarily of gases and is therefore known as a “gas giant”.",
                planetColor1: .yellow,
                planetColor2: .brown
            ),
            .init(
                planetName: "Saturn",
                planetImageUrl: Bundle.main.url(forResource: "saturn", withExtension: "png"),
                planetInformation: "Best known for its fabulous ring system, Saturn is the sixth planet from the Sun and the second largest in our solar system. Like Jupiter, Saturn is a gas giant and is composed of similar gasses including hydrogen, helium and methane.",
                planetColor1: .brown,
                planetColor2: .cyan
            ),
            .init(
                planetName: "Uranus",
                planetImageUrl: Bundle.main.url(forResource: "uranus", withExtension: "png"),
                planetInformation: "Uranus is the seventh planet from the Sun. It’s not visible to the naked eye, and became the first planet discovered with the use of a telescope. Uranus is tipped over on its side with an axial tilt of 98 degrees. It is often described as “rolling around the Sun on its side.”",
                planetColor1: .blue,
                planetColor2: .teal
            ),
            .init(
                planetName: "Neptune",
                planetImageUrl: Bundle.main.url(forResource: "neptune", withExtension: "png"),
                planetInformation: "Neptune is the eighth planet from the Sun, making it the most distant in the solar system. This gas giant may have formed much closer to the Sun in the early solar system history before migrating out to its current position.",
                planetColor1: .blue,
                planetColor2: .indigo
            )
        ]
    }
}

struct PlanetData: Hashable, Identifiable {
    var id: UUID { UUID() }
    let planetName: String
    let planetImageUrl: URL?
    let planetInformation: String
    let planetColor1: Color
    let planetColor2: Color
}

struct PlanetInfoView: View {
    let data: PlanetData
    @Binding var isCardPresented: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(data.planetName)
                    .font(.largeTitle)
                Spacer()
                AsyncImage(url: data.planetImageUrl) { result in
                    result.image?
                        .resizable()
                        .scaledToFill()
                }
                .frame(width: 100, height: 100)
            }
            .padding([.trailing, .bottom])
            
            Text(data.planetInformation)
                .font(.body)
            
            Spacer()
            
            Button {
                isCardPresented.toggle()
            } label: {
                Text("Close")
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.white)
                    .clipShape(.rect(cornerRadius: 10))
                    
            }

        }
        .frame(maxHeight: .infinity, alignment: .top)
        .foregroundStyle(.white)
        .padding(.horizontal, 28)
        .padding(.vertical, 20)
    }
}

#Preview {
    ContentView()
}
