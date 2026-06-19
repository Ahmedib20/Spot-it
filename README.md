# Spot It 📍

A cross-platform Flutter application for discovering and sharing locations, built with Firebase and Google Maps. Spot It runs on Android, iOS, Web, Windows, macOS, and Linux from a single codebase.

## ✨ Features

- **Authentication** — Email/password and Google Sign-In powered by Firebase Auth
- **Interactive Maps** — Real-time location browsing with Google Maps, geolocation, and geocoding
- **Cloud-Backed Data** — Cloud Firestore for data sync and Firebase Storage for media
- **Push Notifications** — Firebase Cloud Messaging integration
- **Media Uploads** — Photo capture/selection via Image Picker
- **Onboarding Flow** — Smooth first-run experience with paged onboarding screens
- **Responsive UI** — Staggered grid layouts, skeleton loading states, and SVG/Ionicons iconography
- **State Management** — Built with GetX for routing, dependency injection, and reactive state

## 🛠 Tech Stack

| Layer | Technology |
|---|---|
| Framework | [Flutter](https://flutter.dev) (Dart SDK ^3.5.1) |
| State Management | [GetX](https://pub.dev/packages/get) |
| Backend | [Firebase](https://firebase.google.com) (Auth, Firestore, Storage, Cloud Messaging) |
| Maps & Location | Google Maps Flutter, Geolocator, Geocoding, Location |
| Auth Provider | Google Sign-In |
| Local Storage | Shared Preferences |
| UI Components | Flutter SVG, Ionicons, Smooth Page Indicator, Flutter Staggered Grid View, Skeletonizer |

## 📋 Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (compatible with Dart ^3.5.1)
- A configured [Firebase project](https://console.firebase.google.com/) with Auth, Firestore, Storage, and Cloud Messaging enabled
- A [Google Maps API key](https://developers.google.com/maps/documentation/android-sdk/get-api-key) for Android/iOS/Web
- Platform-specific build tooling (Android Studio / Xcode) for mobile targets

## 🚀 Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/Ahmedib20/Spot-it.git
   cd Spot-it
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Add your `google-services.json` to `android/app/`
   - Add your `GoogleService-Info.plist` to `ios/Runner/`
   - Run `flutterfire configure` if setting up Firebase for the first time

4. **Add your Google Maps API key**
   - Android: `android/app/src/main/AndroidManifest.xml`
   - iOS: `ios/Runner/AppDelegate.swift`
   - Web: `web/index.html`

5. **Run the app**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
spot_it/
├── android/          # Android platform code
├── ios/               # iOS platform code
├── linux/             # Linux desktop platform code
├── macos/             # macOS desktop platform code
├── windows/           # Windows desktop platform code
├── web/               # Web platform code
├── lib/                # Application source code (Dart)
├── assets/            # Images, icons, and onboarding visuals
├── fonts/              # Custom font families (Roboto, Lobster, etc.)
├── test/               # Unit and widget tests
└── pubspec.yaml        # Project dependencies and configuration
```

## 🧪 Running Tests

```bash
flutter test
```

## 🤝 Contributing

Contributions are welcome! Please open an issue to discuss proposed changes, then submit a pull request.

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-feature`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature/your-feature`)
5. Open a pull request

## 📄 License

No license has been specified for this project yet. Consider adding a [LICENSE](https://choosealicense.com/) file to clarify usage terms.

## 👤 Author

**Ahmed** — [@Ahmedib20](https://github.com/Ahmedib20)
