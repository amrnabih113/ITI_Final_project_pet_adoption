# 🐾 Pet Adoption App

A modern Flutter app that helps users discover and adopt pets from nearby shelters. Built with Firebase, GetX, and a beautiful onboarding experience, this app empowers users to browse, favorite, and adopt animals — all from their phone.

---

## ✨ Key Features

* 📱 **Onboarding Flow** – Engage users with an elegant 3-screen introduction
* 🔐 **Authentication** – Secure login & signup using Firebase Auth + Google Sign-In
* 🐶 **Pet Listings** – Browse available pets with photos, filters, and shelter details
* ❤️ **Favorites** – Save pets to revisit later
* 🛍️ **Bottom Navigation** – Navigate smoothly between core app sections
* 🔄 **Real-Time Updates** – Instantly reflect changes from Firebase Firestore

---

## 💠 Tech Stack

* **Flutter** (v3.8.1)
* **Dart** (null safety enabled)
* **Firebase**

  * Authentication
  * Firestore
  * Storage
* **State Management**: GetX
* **Design**: Material Design 3

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
  static const Color primaryColor   = Color(0xFFED6A5A);
  static const Color background    = Color(0xFFFDF6EC);
  static const Color textPrimary   = Color(0xFF222222);
  static const Color textSecondary = Color(0xFF757575);
  static const Color accent        = Color(0xFF91C788);
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
  flutter:
  get: ^4.6.6
  firebase_core: ^2.0.0
  firebase_auth: ^4.0.0
  cloud_firestore: ^4.0.0
  firebase_storage: ^11.0.0
  google_sign_in: ^6.0.0
  flutter_svg: ^2.0.7
```

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 💬 Contributing

Pull requests are welcome! If you're fixing a bug or adding a feature, please open an issue first to discuss.

---

## ❤️ Made for people who love pets — and code.
