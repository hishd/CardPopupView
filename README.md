# CardPopupView

<p>
<img src="https://img.shields.io/badge/iOS-14.0-blue">
<img src="https://img.shields.io/badge/Swift-5.9-violet">
</p>

<p>
  	<img src="https://github.com/hishd/CardPopupView/blob/main/CardPopupViewDemo/demo.gif?raw=true" height="412">
</p>

### Overview

A lightweight SwiftUI popup card component which displays a popup just like a sheet but with some animations (rotation 3d effects).

## Installation

To add **CardPopupView** to your project:
Add the repository URL to your project’s package dependencies.

## Usage

```swift
struct ContentView: View {

	@State var isCardPresented: Bool = false
	@State var backgroundGradient: LinearGradient = .init(colors: [.black, .white], startPoint: .top, endPoint: .bottom)

	var body: some  View {
		VStack {
		}
		.cardPopupView(
		isPresented: $isCardPresented,
		backgroundType: .gradient(backgroundGradient)
		) {
			Text("Popup view content")
		}
	}
}
```

### Background

The background of the popup can be customized and can be set to a solid color or a gradient.

To use a solid color use:

```swift
backgroundType: .solid(.black)
```

To use a gradient color use:

```swift
backgroundType: .gradient(backgroundGradient)
```




