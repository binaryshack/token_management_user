# token_management_user
# Flutter Firebase Team Project (MVC Architecture)

This project is a **Flutter mobile app** using **Firebase** as the backend.  
It follows the **MVC (Model-View-Controller)** architecture for clean, maintainable code.  

---

## 📁 Folder Structure

lib/
│
├── main.dart # Entry point of the app
│
├── core/ # App-wide utilities
│ ├── firebase/ # Firebase config
│ │ └── firebase_options.dart
│ ├── constants/ # Colors, text styles, keys, etc.
│ ├── helpers/ # Validators, formatters, common functions
│ └── routes/ # App navigation routes
│
├── models/ # M (Model) - Data structures
│ ├── user_model.dart
│ ├── hotel_model.dart
│ └── booking_model.dart
│
├── controllers/ # C (Controller) - Business logic / State management
│ ├── auth_controller.dart
│ ├── hotel_controller.dart
│ └── booking_controller.dart
│
├── views/ # V (View) - UI screens & widgets
│ ├── auth/
│ │ ├── login_page.dart
│ │ └── signup_page.dart
│ ├── hotel/
│ │ ├── hotel_list_page.dart
│ │ └── hotel_detail_page.dart
│ └── booking/
│ ├── booking_page.dart
│ └── booking_success_page.dart
│
├── services/ # Firebase / API services
│ ├── firebase_auth_service.dart
│ ├── firestore_service.dart
│ └── storage_service.dart
│
└── repository/ # Optional - Data access abstraction
├── auth_repository.dart
├── hotel_repository.dart
└── booking_repository.dart


---

## ⚡ Firebase Setup

Since this is a **public repo**, the Firebase config files are **not included** for security reasons.  

### Steps for team members:
1. Ask the project admin for the `google-services.json` (Android) and `GoogleService-Info.plist` (iOS).  
2. Place the files in the respective folders:  
   - Android: `android/app/google-services.json`  
   - iOS: `ios/Runner/GoogleService-Info.plist`  
3. `firebase_options.dart` is already included in `lib/core/firebase/`.  
4. Initialize Firebase in `main.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:your_app/core/firebase/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

