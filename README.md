# 🐾 Pet Adoption App

A modern Flutter app that helps users discover and adopt pets from nearby shelters, connect with a pet-loving community, and share stories. Built with **Firebase**, **GetX**, and a polished onboarding experience, this app empowers users to browse, filter, favorite, adopt animals, and engage socially — all from their phone.

---

## ✨ Key Features

| Feature               | Description                                                    |
| --------------------- | -------------------------------------------------------------- |
| 🟢 Splash Screen      | Clean app launcher with initial setup                          |
| 📱 Onboarding + Auth  | Firebase login, signup, and onboarding flow                    |
| 🔐 Authentication     | Email/Password and Google Sign-In via Firebase                 |
| 🐶 Pet Listings       | Browse pets with real images, filters, and shelter info        |
| ❤️ Favorites          | Save favorite pets for later                                   |
| 📝 Add a Pet          | Post a new pet for adoption with images                        |
| 🧠 Real-Time Updates  | Firestore updates reflect live across the app                  |
| 🛍️ Bottom Navigation | Animated notch bottom bar for modern navigation                |
| 👤 User Profile       | Edit user info, view saved pets, and more                      |
| 🌗 Dark & Light Theme | Adaptive themes based on system preferences                    |
| 🎨 Clean UI           | Modern, minimal, pet-friendly design                           |
| ⚡ Fast UX             | Built using GetX for reactive, performant state management     |
| 📸 Community Page     | Share pet stories, post media, like/comment, follow users      |
| 🔔 Push Notifications | Get notified about new pets, community posts, and interactions |

---

## 🧱 Tech Stack

| Technology                   | Purpose                                             |
| ---------------------------- | --------------------------------------------------- |
| Flutter                      | App development framework                           |
| Firebase                     | Backend (Auth, Firestore, Storage, Cloud Messaging) |
| GetX                         | State management and routing                        |
| animated\_notch\_bottom\_bar | Animated bottom navigation                          |
| Iconsax                      | Icon set for modern UI                              |
| Carousel Slider              | Show pet images in carousels                        |
| CachedNetworkImage           | Optimized image caching/loading                     |

---

## 📸 Community Features

| Feature           | Description                                               |
| ----------------- | --------------------------------------------------------- |
| Post Creation     | Upload pet photos/videos with captions and tags           |
| Reactions         | Like and comment on posts                                 |
| Follow System     | Follow/unfollow users to personalize your feed            |
| Explore Feed      | Discover trending pet stories and adoption updates        |
| Real-Time Updates | Posts, likes, and comments appear instantly via Firestore |

---

## 🧹 Folder Structure

```
lib/
├── core/               # Global constants, themes, colors
├── controllers/        # GetX Controllers for all screens
├── models/             # Data models (User, Pet, Post, etc.)
├── views/              # UI screens
│   ├── home/
│   ├── category/
│   ├── community/
│   ├── profile/
├── widgets/            # Reusable widgets
├── firebase_options.dart
└── main.dart
```

---

## 🎨 Design System

```dart
class MyColors {
  static const Color primaryColor = Color(0xFFFFA726);
  static const Color secondaryColor = Color(0xFF81D4FA);
  static const Color accent = Color(0xFFAED581);
  static const Color darker = Color(0xFF616161);
  static const Color buttonDark = Color(0xFF4F4F4F);
  static const Color buttonLight = Color(0xFFF4F4F4);
  static const Color selectedButton = Color(0xFFCE93D8);
}
```

Fonts: GoogleFonts + System fonts. Consistent text hierarchy via ThemeData.

---

## 🚀 Getting Started

1. Clone the Repo

```bash
git clone https://github.com/your-username/pet_adoption_app.git
cd pet_adoption_app
flutter pub get
```

2. Set up Firebase

   * Add your google-services.json and GoogleService-Info.plist
   * Enable Email/Password and Google Sign-In in Firebase Auth
   * Set up Firestore DB and Storage
   * Configure Firebase Cloud Messaging for push notifications

---

## 📦 Dependencies

```yaml
dependencies:
  animated_notch_bottom_bar: ^1.0.3
  build_runner: ^2.6.0
  carousel_slider: ^5.1.1
  cloud_firestore: ^6.0.0
  connectivity_plus: ^6.1.4
  cupertino_icons: ^1.0.8
  equatable: ^2.0.7
  firebase_auth: ^6.0.0
  firebase_cloud_messaging_flutter: ^1.0.6
  firebase_core: ^4.0.0
  flutter:
    sdk: flutter
  flutter_local_notifications: ^19.4.0
  firebase_messaging: ^16.0.0
  flutter_native_splash: ^2.4.6
  flutter_staggered_grid_view: ^0.7.0
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
  supabase: ^2.8.0
  supabase_flutter: ^2.9.1
  url_launcher: ^6.3.2
  uuid: ^4.5.1
```

---

## 💬 Contributing

Open to suggestions and contributions! Please submit a PR or open an issue before major changes.

---

❤️ Made with Flutter — For pet lovers everywhere.
