# 🐾 Pet Adoption App

A modern Flutter app that helps users discover and adopt pets from nearby shelters. Built with Firebase, GetX, and a beautiful onboarding experience, this app empowers users to browse, favorite, and adopt animals — all from their phone.

---

## ✨ Key Features

✅ Features

🟢 Splash Screen – Initial loader and setup

📱 Onboarding + Firebase Login / Signup

🔐 Authentication – Secure login using Firebase Auth + Google Sign-In

🐶 Pet Listings – Browse available pets with images, filters, and shelter details

❤️ Favorites – Save pets you love to revisit later

📝 Add a Pet – Post a pet for adoption

🧠 Real-Time Updates – Instantly reflect changes using Firebase Firestore

🛍️ Bottom Navigation – Smooth navigation across the app

👤 User Profile – View and edit profile information

🌓 Dark & Light Theme – Automatically adapt to system theme

🎨 Clean UI – Minimal, modern, and responsive

⚡ Fast UX – Powered by GetX for high performance
---

## 🧱 Tech Stack

| Technology   | Purpose                      |
|--------------|------------------------------|
| Flutter      | UI framework                 |
| GetX         | State management & routing   |
| Firebase     | Auth & backend (Cloud Firestore) |
| Iconsax      | Beautiful icons              |
| Carousel Slider | Image carousels           |
| CachedNetworkImage | Image optimization     |


---

## 🧹 Folder Structure

```
lib/
├── core/               # App-wide constants (colors, themes, etc.)
├── controllers/        # GetX Controllers
├── models/             # Data models (e.g., onboarding, pets)
├── views/              # UI Screens
├── firebase_options.dart
└── main.dart
```

---

## 🎨 Design System

A warm, pet-friendly color palette designed for accessibility and brand identity:

```dart
class MyColors {
 // App basic Colors
  static const Color primaryColor = Color(0xFFFFA726); // Warm Orange
  static const Color secondaryColor = Color(0xFF81D4FA); // Sky Blue
  static const Color accent = Color(0xFFAED581); // Mint Green
  static const Color darker = Color(0xFF616161); // Slate Gray
  static const Color buttonDark = Color(0xFF4F4F4F); // Darker Neutral
  static const Color buttonLight = Color(0xFFF4F4F4); // Light Grey
  static const Color selectedButton = Color(0xFFCE93D8); // Lilac Accent
}
```

Fonts: System fonts with headline/body emphasis via `ThemeData`.

---


## 🚀 Getting Started

### 1. Clone & Install

```bash
git clone https://github.com/your-username/pet_adoption_app.git
cd pet_adoption_app
flutter pub get
```

## 🛆 Packages

```yaml
dependencies:
  build_runner: ^2.6.0
  carousel_slider: ^5.1.1
  connectivity_plus: ^6.1.4
  cupertino_icons: ^1.0.8
  firebase_auth: ^6.0.0
  firebase_core: ^4.0.0
  flutter:
    sdk: flutter
  flutter_native_splash: ^2.4.6
  get: ^4.7.2
  get_storage: ^2.1.1
  getx_test: ^1.0.3
  google_fonts: ^6.3.0
  google_sign_in: ^6.2.2
  iconsax: ^0.0.8
  intl: ^0.20.2
  logger: ^2.6.1
  lottie: ^3.3.1
  shimmer: ^3.0.0
  url_launcher: ^6.3.2
  
```

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 💬 Contributing

Pull requests are welcome! If you're fixing a bug or adding a feature, please open an issue first to discuss.

---

## ❤️ Made for people who love pets — and code.
