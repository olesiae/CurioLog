# CurioLog

**CurioLog** is an iOS app built with SwiftUI that delivers fun, weird, and surprising facts — and automatically classifies them using a custom on-device Core ML model.

![screenshot](screenshot.png)

---

##  Features

- Get a new random fact with a tap
- Save your favorite facts
- Search facts in Google
- Categories are predicted using a trained Core ML model
- Favorites are stored locally with `UserDefaults`
- Dynamic gradient backgrounds and clean card-style UI

---

##  Architecture

- SwiftUI + MVVM
- Async API calls using `async/await`
- Custom ML model (trained with Create ML)
- Modular components (e.g., `FactCardView`, `ActivityView`)
- Local persistence without external libraries

---

## Tech Stack

- Swift 5.9+
- SwiftUI
- Core ML (text classification)
- Create ML
- URLSession
- UserDefaults

---

##  Getting Started

1. Clone the repository
2. Open `CurioLog.xcodeproj` in Xcode
3. Make sure the `.mlmodel` is included in the project
4. Run the app on a simulator or device

---

##  Possible Improvements

- Filter facts by category
- Add dark mode support
- Support for multiple languages
- Export/import favorites
- Mini-game: “Fact or Fiction?”

---

Made with 💡 by [@olesiae](https://github.com/olesiae)
