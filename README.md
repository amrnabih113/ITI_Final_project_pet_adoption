# 🐾 Pet Adoption App

A modern Flutter app that helps users discover and adopt pets from nearby shelters. Built with **Firebase**, **GetX**, and a polished onboarding experience, this app empowers users to browse, filter, favorite, and adopt animals — all from their phone.

---

## ✨ Key Features

| Feature                     | Description |
|----------------------------|-------------|
| 🟢 Splash Screen           | Clean app launcher with initial setup |
| 📱 Onboarding + Auth       | Firebase login, signup, and onboarding flow |
| 🔐 Authentication          | Email/Password and Google Sign-In via Firebase |
| 🐶 Pet Listings            | Browse pets with real images, filters, and shelter info |
| ❤️ Favorites               | Save favorite pets for later |
| 📝 Add a Pet               | Post a new pet for adoption with images |
| 🧠 Real-Time Updates       | Firestore updates reflect live across the app |
| 🛍️ Bottom Navigation       | `animated_notch_bottom_bar` for modern navigation |
| 👤 User Profile            | Edit user info, view saved pets, and more |
| 🌗 Dark & Light Theme      | Adaptive themes based on system preferences |
| 🎨 Clean UI                | Modern, minimal, pet-friendly design |
| ⚡ Fast UX                 | Built using GetX for reactive, performant state management |

---

## 🧱 Tech Stack

| Technology            | Purpose                        |
|-----------------------|--------------------------------|
| Flutter               | App development framework      |
| Firebase              | Backend (Auth, Firestore, Storage) |
| GetX                  | State management and routing   |
| animated_notch_bottom_bar | Animated bottom navigation  |
| Iconsax               | Icon set for modern UI         |
| Carousel Slider       | Show pet images in carousels   |
| CachedNetworkImage    | Optimized image caching/loading |

---

## 🧹 Folder Structure

```bash
lib/
├── core/               # Global constants, themes, colors
├── controllers/        # GetX Controllers for all screens
├── models/             # Data models (User, Pet, etc.)
├── views/              # UI screens
│   ├── home/
│   ├── category/
│   ├── community/
│   ├── profile/
├── widgets/            # Reusable widgets (e.g. PetGridCard)
├── firebase_options.dart
└── main.dart
```
🎨 Design System
dart
```
class MyColors {
  static const Color primaryColor = Color(0xFFFFA726);     // Warm Orange
  static const Color secondaryColor = Color(0xFF81D4FA);   // Sky Blue
  static const Color accent = Color(0xFFAED581);           // Mint Green
  static const Color darker = Color(0xFF616161);           // Slate Gray
  static const Color buttonDark = Color(0xFF4F4F4F);       // Dark Neutral
  static const Color buttonLight = Color(0xFFF4F4F4);      // Light Gray
  static const Color selectedButton = Color(0xFFCE93D8);   // Lilac Accent
}
```
Fonts: GoogleFonts + System fonts. Consistent text hierarchy via ThemeData.

🚀 Getting Started
1. Clone the Repo
bash
```
git clone https://github.com/your-username/pet_adoption_app.git
cd pet_adoption_app
flutter pub get
```
2. Set up Firebase
Add your google-services.json and GoogleService-Info.plist

Enable Email/Password and Google Sign-In in Firebase Auth

Set up Firestore DB with your collections

📦 Dependencies
yaml
```
dependencies:
  flutter:
    sdk: flutter
  get: ^4.7.2
  firebase_core: ^4.0.0
  firebase_auth: ^6.0.0
  cloud_firestore: ^5.0.0
  google_sign_in: ^6.2.2
  google_fonts: ^6.3.0
  get_storage: ^2.1.1
  carousel_slider: ^5.1.1
  cached_network_image: ^3.3.1
  animated_notch_bottom_bar: ^1.0.0
  shimmer: ^3.0.0
  iconsax: ^0.0.8
  intl: ^0.20.2
  lottie: ^3.3.1
  flutter_native_splash: ^2.4.6
  url_launcher: ^6.3.2
  logger: ^2.6.1
```
💬 Contributing
Open to suggestions and contributions!
Please submit a PR or open an issue before major changes.

❤️ Made with Flutter — For pet lovers everywhere.
